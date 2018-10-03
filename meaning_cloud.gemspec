# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'meaning_cloud/version'

Gem::Specification.new do |spec|
  spec.name          = 'meaning_cloud'
  spec.version       = MeaningCloud::VERSION
  spec.authors       = ['Nadav Shatz' ,'Mohamed Ziata']
  spec.email         = ['nadav@tailorbrands.com', 'wakematta@gmail.com']

  spec.summary       = %q{An API wrapper for Meaning Cloud API's}
  spec.description   = %q{A Gem to expose a wrapping API for the Meaning Cloud API's}
  spec.homepage      = 'https://github.com/WaKeMaTTa/meaning_cloud'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'gem-release', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
