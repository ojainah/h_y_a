require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module HYA
  class Application < Rails::Application
    config.load_defaults 6.0
        # 以下を追加すれば日本語に
    config.i18n.default_locale = :ja
# タイムゾーンも変更するなら，以下を追加
    config.time_zone = 'Asia/Tokyo'
  end
end
