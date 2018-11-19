# frozen_string_literal: true

require 'meaning_cloud/version'
require 'meaning_cloud/topics'

module MeaningCloud
  def self.configuration
    @configuration ||=  Configuration.new
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration) if block_given?
  end

  # Main configuration class.
  class Configuration
    attr_accessor :key, :language, :topic_types, :api_base, :user_dictionary

    def initialize
      @key = nil
      @language = :en
      @topic_types = 'ec'
      @api_base = 'https://api.meaningcloud.com/topics-2.0'
      @user_dictionary = nil
    end
  end
end
