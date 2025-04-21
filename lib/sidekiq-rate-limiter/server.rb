require 'sidekiq-rate-limiter/version'
require 'sidekiq-rate-limiter/fetch'

Sidekiq.configure_server do |config|
  # For Sidekiq < 6.1.0
  if Sidekiq::BasicFetch.respond_to?(:bulk_requeue) 
    Sidekiq.options[:fetch] = Sidekiq::RateLimiter::Fetch

  # For Sidekiq 6.1.0 to < 6.5.0
  elsif Sidekiq::VERSION < '6.5.0'
    Sidekiq.options[:fetch] = Sidekiq::RateLimiter::Fetch.new(Sidekiq.options)

  # For Sidekiq 6.5.0 to < 7.0.0
  elsif Sidekiq::VERSION < '7.0.0'
    Sidekiq[:fetch] = Sidekiq::RateLimiter::Fetch.new(Sidekiq)

  # For Sidekiq 7.0.0+
  else
    # Adapt to the new capsule architecture (fetch default capsule)
    config.on(:startup) do
      Sidekiq.default_capsule.fetcher = Sidekiq::RateLimiter::Fetch.new(Sidekiq)
    end
  end
end