require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module HYA
  class Application < Rails::Application
  
  # Rails６
   config.load_defaults 6.0

  # 日本語
   config.i18n.default_locale = :ja
   config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
  # タイムゾーン
   config.time_zone = 'Asia/Tokyo'
  end
end
