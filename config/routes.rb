# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    post 'fibonacci', to: 'fibonaccis#create'
  end
end
