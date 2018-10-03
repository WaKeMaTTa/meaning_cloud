# frozen_string_literal: true

require 'json'
require 'rest_client'

module MeaningCloud
  # A class to hold all topic extraction related code.
  #
  # :reek:MissingSafeMethod { exclude: [ required_key! ] }
  class Topics
    attr_reader :options

    def self.extract_topics(options = {})
      new(options).call
    end

    def initialize(options = {})
      @options = {
        of: :json,
        key: configuration.key,
        lang: configuration.language,
        tt: configuration.topic_types,
        uw: 'y'
      }.merge(options)
    end

    def call
      required_key!(options)
      result = RestClient.post(configuration.api_base, options)
      JSON.parse(result)
    end

    private

    def configuration
      @configuration ||= MeaningCloud.configuration
    end

    def required_key!(options = {})
      return if MeaningCloud.configuration.key || options[:key]

      raise(MissingKeyError, 'Missing meaning cloud key')
    end
  end

  # StandardError used when API Key is missing
  class MissingKeyError < StandardError; end
end
