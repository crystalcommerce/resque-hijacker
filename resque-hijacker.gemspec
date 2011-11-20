# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "resque-hijacker"

Gem::Specification.new do |s|
  s.name        = "resque-hijacker"
  s.version     = "0.0.2"
  s.authors     = ["Donald Plummer"]
  s.email       = ["donald@crystalcommerce.com"]
  s.homepage    = "https://github.com/crystalcommerce/resque-hijacker"
  s.summary     = %q{Resque workers use Hijacker}
  s.description = %q{For use with the Hijacker plugin for multiple databases.}

  s.rubyforge_project = "resque-hijacker"

  s.files         = %w( README.md Rakefile LICENSE )
  s.files        += Dir.glob("lib/**/*")
  s.files        += Dir.glob("test/**/*")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_development_dependency "bundler", [">= 1.0.2", "< 1.2.0"]
  #s.add_development_dependency "rspec", "~> 1.3.0"

  s.add_dependency "redis", "~> 2.2.0"
  s.add_dependency "resque", [">= 1.18.0", "< 1.20.0"]
end
