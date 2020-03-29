# frozen_string_literal: true

class VolunteersController < ApplicationController
  def new
    @volunteer = Volunteer.new
    @professions = Profession.all
  end

  def create
    @volunteer = Volunteer.new(volunteer_params)
    if @volunteer.save
      redirect_to :root, notice: 'You successfully submitted. You should receive a confirmation text message shortly'
    else
      redirect_to new_volunteer_path, alert: @volunteer.errors.full_messages.to_sentence
    end
  end

  private

  def volunteer_params
    p = params.require(:volunteer).permit(
      :name,
      :zip,
      :profession_id,
      :phone,
      license: %i[active number full_name expiration_date state]
    )
    p[:license_attributes] = p.delete(:license)
    p
  end
end
