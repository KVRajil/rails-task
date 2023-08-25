# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    get 'fibonacci',  to: "fibonaccis#index"
    post 'fibonacci', to: 'fibonaccis#create'
  end
end
