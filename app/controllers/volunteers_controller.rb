# frozen_string_literal: true

class VolunteersController < ApplicationController
  def index
    @professions = Profession.all.map { |p| [p.title, p.id] }.unshift ['Select a Profession', nil]
    @volunteers = Volunteer.all
    if zip_result.present? && query_params[:profession_id].present?
      @volunteers = @volunteers.joins(:profession).where('professions.id = ?', query_params[:profession_id])
      @volunteers = @volunteers.near([zip_result.latitude, zip_result.longitude], 5)
    else
      @volunteers = @volunteers.none
    end
  end

  def new
    @volunteer = Volunteer.new
    @professions = Profession.all
  end

  def create
    @volunteer = Volunteer.new(volunteer_params)
    if @volunteer.save
      redirect_to :root, notice: 'You successfully submitted. You should receive a confirmation text message shortly'
      send_welcome_sms
    else
      redirect_to new_volunteer_path, alert: @volunteer.errors.full_messages.to_sentence
    end
  end

  private

  def query_params
    params.permit(:zip, :profession_id)
  end

  def zip_result
    @zip_result ||= Geocoder.search(query_params[:zip]).first
  end

  def volunteer_params
    p = params.require(:volunteer).permit(
      :name,
      :zip,
      :profession_id,
      :phone,
      license: %i[active number full_name expiration_date state]
    )
    p[:license_attributes] = p.delete(:license)
    p[:phone] = "+1#{p[:phone].gsub('-', '')}"
    p
  end

  def send_welcome_sms
    client = Twilio::REST::Client.new
    client.messages.create(
      body: "You've been entered. This is the number you will be receiving notifications from. Text STOP at anytime to be removed from this service.",
      to: @volunteer.phone,
      from: Rails.application.credentials.dig(:twilio, :phone_number)
    )
  end
end
