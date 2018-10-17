# frozen_string_literal: true

RSpec.describe MeaningCloud::Topics do
  before :each do
    MeaningCloud.configuration.key = nil
  end

  let(:key) { 'random-meaning-cloud-key' }

  let(:txt) do
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.
      Lorem Ipsum has been the industry's standard dummy text eversince the
      1500s, when an unknown printer took a galley of type and scrambled it to
      make a type specimen book. It has survived not only five centuries, but
      also the leap into electronic typesetting, remaining essentially
      unchanged. It was popularised in the 1960s with the release of Letraset
      sheets containing Lorem Ipsum passages, and more recently with desktop
      publishing software like Aldus PageMaker including versions of Lorem
      Ipsum."
  end

  let(:result) do
    "{\"status\":{\"code\":\"0\",\"msg\":\"OK\",\"credits\":\"1\",\"remaining_credits\":\"39993\"},\"entity_list\":[],\"concept_list\":[]}"
  end

  it 'raises an error on empty key' do
    RSpec::Expectations.configuration.on_potential_false_positives = :nothing
    MeaningCloud.configuration.key = nil
    expect do
      MeaningCloud::Topics.extract_topics(txt: txt)
    end.to raise_error(MeaningCloud::MissingKeyError)
  end

  it 'do not raises an error if key is in the options' do
    RSpec::Expectations.configuration.on_potential_false_positives = :nothing
    MeaningCloud.configuration.key = nil
    expect do
      MeaningCloud::Topics.extract_topics(key: key, txt: txt)
    end.not_to raise_error(MeaningCloud::MissingKeyError)
  end

  it 'sends a proper request' do
    MeaningCloud.configuration.key = key
    expect(RestClient).to receive(:post)
      .with('https://api.meaningcloud.com/topics-2.0', { key: key, lang: :en, of: :json, tt: 'ec', txt: txt, ud: nil, uw: 'y' })
      .and_return(result)
    expect(MeaningCloud::Topics.extract_topics(txt: txt)).to eq(JSON.parse(result))
  end
end
