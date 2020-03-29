# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'

  resources :volunteers, only: %i[index new create]
end
