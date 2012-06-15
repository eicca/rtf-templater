# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rtf-templater/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["eicca"]
  gem.email         = ["wtltl2@gmail.com"]
  gem.description   = %q{Embedded ruby for RTF documents. You provide .rtf template and data and rtf-templater generates the document.}
  gem.summary       = %q{Generate RTF documents based on template with erb}
  gem.homepage      = "https://github.com/eicca/rtf-templater"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rtf-templater"
  gem.require_paths = ["lib"]
  gem.version       = RtfTemplater::VERSION

  gem.add_development_dependency 'rspec', '>= 2.5'
end
