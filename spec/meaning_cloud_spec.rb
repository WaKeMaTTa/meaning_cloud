# frozen_string_literal: true

RSpec.describe MeaningCloud do
  before :each do
    MeaningCloud.configuration.key = nil
  end

  it 'has a version number' do
    expect(MeaningCloud::VERSION).not_to be_nil
  end

  it 'has the correct default' do
    expect(MeaningCloud.configuration.key).to         be_nil
    expect(MeaningCloud.configuration.language).to    be(:en)
    expect(MeaningCloud.configuration.topic_types).to be('ec')
    expect(MeaningCloud.configuration.api_base).to    be('https://api.meaningcloud.com/topics-2.0')
  end

  it 'sets the correct configuration' do
    expect(MeaningCloud.configuration.key).to be_nil

    MeaningCloud.configure do |config|
      config.key         = 'random-meaning-cloud-key'
      config.language    = :es
      config.topic_types = 'a'
      config.api_base    = 'https://api.example.com/topics-2.0'
    end

    expect(MeaningCloud.configuration.key).to         be('random-meaning-cloud-key')
    expect(MeaningCloud.configuration.language).to    be(:es)
    expect(MeaningCloud.configuration.topic_types).to be('a')
    expect(MeaningCloud.configuration.api_base).to    be('https://api.example.com/topics-2.0')
  end
end
