# frozen_string_literal: true

module Api
  class FibonaccisController < ApplicationController
    def create
      if params[:n].present? && params[:n].is_a?(Integer)
        response = FibonacciService.new(params[:n]).call
        status = :created
      else
        response = { error: 'Invalid parameter n. Please provide a positive integer' }
        status = :bad_request
      end

      render json: response, status: status
    end
  end
end
