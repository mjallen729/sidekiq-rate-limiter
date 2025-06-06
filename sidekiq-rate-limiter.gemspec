# -*- encoding: utf-8 -*-

$:.push File.expand_path("../lib", __FILE__)
require "sidekiq-rate-limiter/version"

Gem::Specification.new do |s|
  s.name        = "sidekiq-rate-limiter"
  s.license     = 'MIT'
  s.version     = Sidekiq::RateLimiter::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Docady", "Blake Thomas", "Enova"]
  s.email       = ["bwthomas@gmail.com"]
  s.homepage    = "https://github.com/enova/sidekiq-rate-limiter"
  s.summary     = %q{Redis-backed, per-worker rate limits for job processing}
  s.description = %q{Redis-backed, per-worker rate limits for job processing}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "pry"
  s.add_development_dependency "pry-byebug"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec", '~> 3.4'
  s.add_development_dependency "simplecov"
  s.add_development_dependency "simplecov-lcov", '~> 0.8.0'

  s.add_dependency "sidekiq", ">= 4.0", "< 9.0"  # Increase upper bound to include Sidekiq 8.x
  s.add_dependency "redis_rate_limiter"
  s.required_ruby_version = '>= 2.7.0'  # Add explicit Ruby version requirement
end
