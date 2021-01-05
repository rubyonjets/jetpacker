$:.push File.expand_path("../lib", __FILE__)
require "jetpacker/version"

Gem::Specification.new do |s|
  s.name     = "jetpacker"
  s.version  = Jetpacker::VERSION
  s.authors  = [ "Tung Nguyen" ]
  s.email    = [ "tongueroo@gmail.com" ]
  # Only commented out, so people do not accidentally contact the incorrect person for jetspacker specific related issues.
  # Credit goes to original authors of the work:
  # s.authors  = [ "David Heinemeier Hansson", "Gaurav Tiwari" ]
  # s.email    = [ "david@basecamp.com", "gaurav@gauravtiwari.co.uk" ]
  s.summary  = "Use webpack to manage app-like JavaScript modules in Jets"
  s.homepage = "https://github.com/tongueroo/jetpacker"
  s.license  = "MIT"

  s.metadata = {
    "source_code_uri" => "https://github.com/tongueroo/jetpacker/tree/v#{Jetpacker::VERSION}",
    "changelog_uri"   => "https://github.com/tongueroo/jetpacker/blob/v#{Jetpacker::VERSION}/CHANGELOG.md"
  }

  s.required_ruby_version = ">= 2.4.0"

  s.add_dependency "activesupport", ">= 5.2"
  s.add_dependency "railties",      ">= 5.2"
  s.add_dependency "rack-proxy",    ">= 0.6.1"
  s.add_dependency "semantic_range", ">= 2.3.0"

  s.add_development_dependency "bundler", ">= 1.3.0"
  s.add_development_dependency "rubocop", "< 0.69"
  s.add_development_dependency "rubocop-performance"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- test/*`.split("\n")
end
