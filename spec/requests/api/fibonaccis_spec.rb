# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::Fibonacci', type: :request do
  let(:json_response) { response.parsed_body.with_indifferent_access }
  let(:headers) { { ACCEPT: 'application/json', CONTENT_TYPE: 'application/json' } }

  describe 'POST /fibonacci' do
    context 'when parameter n is present' do
      it 'calculates the Fibonacci value and returns JSON response' do
        post('/api/fibonacci', params: { n: 3 }.to_json, headers:)

        expect(response).to have_http_status(:success)
        expect(json_response).to include('value', 'result', 'runtime')
        expect(json_response['value']).to eq(3)
        expect(json_response['result']).to eq(2)
        expect(json_response['runtime']).to be_a(Float)
      end
    end

    context 'when parameter n is invalid' do
      it 'returns a bad request when the parameter n is missing' do
        post('/api/fibonacci', params: {}, headers:)

        expect(response).to have_http_status(:bad_request)
        expect(json_response).to include('error')
        expect(json_response['error']).to eq('Invalid parameter n. Please provide a positive integer')
      end

      it 'returns a bad request when the parameter n is not an integer' do
        post('/api/fibonacci', params: { n: 'abc' }.to_json, headers:)

        expect(response).to have_http_status(:bad_request)
        expect(json_response).to include('error')
        expect(json_response['error']).to eq('Invalid parameter n. Please provide a positive integer')
      end
    end
  end
end
