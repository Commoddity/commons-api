# frozen_string_literal: true

# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application

require 'rack/cors'
use Rack::Cors do
  allow do
    origins 'http://localhost:3000'
    resource '*',
    headers: :any,
    methods: [:get, :post, :delete, :put, :patch, :options, :head],
    max_age: 0,
    expose: :location
  end
end
