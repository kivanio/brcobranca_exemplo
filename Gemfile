source 'https://rubygems.org'
ruby '2.2.2'

gem 'rails',                      '4.2.1'

# Server, Rack & Middlewares
gem 'puma',                       '2.11.2'
gem 'rack-canonical-host',        '0.1.0'

gem "rghost"
gem "rghost_barcode"
gem "parseline"
gem "brcobranca", :git => "git://github.com/kivanio/brcobranca.git", :branch => "master"

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug'
  gem 'spring'
  gem 'foreman'
end

group :production, :staging, :sandbox do
  gem 'rails_12factor',             '0.0.3'
  gem 'kgio',                       '2.9.3'
end
