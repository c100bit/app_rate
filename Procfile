web: bundle exec puma -C config/puma.rb -e $RAILS_ENV
worker: bundle exec sidekiq -c 1 -e $RAILS_ENV -C config/sidekiq.yml