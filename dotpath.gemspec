# frozen_string_literal: true

require_relative 'lib/dotpath/version'

Gem::Specification.new do |spec|
  spec.name          = 'dotpath'
  spec.version       = Dotpath::VERSION
  spec.authors       = ['Garrett Bjerkhoel']
  spec.email         = ['me@garrettbjerkhoel.com']

  spec.summary       = 'dotpath gives you utilities to navigate and modify hashes and arrays in Ruby with the JSON path to each value in the hash or array.'
  spec.description   = 'dotpath gives you utilities to navigate and modify hashes and arrays in Ruby with the JSON path to each value in the hash or array.'
  spec.homepage      = 'https://github.com/dewski/dotpath'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/dewski/dotpath'
  spec.metadata['changelog_uri'] = 'https://github.com/dewski/dotpath'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '2.1.4'
  spec.add_development_dependency 'byebug', '11.0.1'
  spec.add_development_dependency 'minitest', '5.13.0'
  spec.add_development_dependency 'rake', '10.5.0'
  spec.add_development_dependency 'rubocop', '0.78.0'
  spec.add_development_dependency 'rubocop-performance', '1.5.2'
  spec.add_development_dependency 'yard', '0.9.24'
end
