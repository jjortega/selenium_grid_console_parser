# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "selenium-grid-parser"
  spec.version       = "0.0.3"
  spec.authors       = ["jjortega"]
  spec.email         = ["juanjortcan@gmail.com"]
  spec.summary       = %q{Selenium-Grid doesn't have a pretty API so let parse it!}
  spec.description   = %q{Selenium-Grid doesn't have a pretty API so this gem is for parser the result of /grid/console to know
                        which nodes are free to use them when running your tests}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "nokogiri", "~> 1.6"
  spec.add_development_dependency "httparty", "~> 0.13"
end
