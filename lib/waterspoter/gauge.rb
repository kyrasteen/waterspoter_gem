require 'faraday'
require 'json'

API_URL = "https://waterspot.herokuapp.com/api/v1/gauges"

module Waterspoter
  class Gauge
    attr_reader :type, :coordinates, :name, :value

    def initialize(attributes)
      @type        = attributes.first["type"]
      @coordinates = attributes.first["geometry"]["coordinates"]
      @name        = attributes.first["properties"]["name"]
      @value       = attributes.first["properties"]["value"]
    end

    def self.find_by_state(state)
      response = Faraday.get("#{API_URL}/#{state}")
      attributes = JSON.parse(response.body)
      new(attributes)
    end

  end
end
