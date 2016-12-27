# 로그프레소 루비 SDK

## Ruby on Rails 웹 프레임워크 로그 수집 설정 예시
config/application.rb 파일에 아래의 로깅 설정을 추가합니다.
```
require_relative 'boot'

require 'rails/all'
require 'logger'
require 'logpresso-logger'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Blog

  class Application < Rails::Application

    config.logger = ActiveSupport::Logger.new(LogpressoLogger.new(:udp, 'localhost', 514))

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end

```