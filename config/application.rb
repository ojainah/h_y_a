require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module HYA
  class Application < Rails::Application
  
   config.load_defaults 6.0

  # 日本語
   config.i18n.default_locale = :ja
  # タイムゾーン
   config.time_zone = 'Asia/Tokyo'
  end
end
