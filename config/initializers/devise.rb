class CustomFailure < Devise::FailureApp
  def redirect_url
    # 未ログインでアクセスしてきたときはサインアップページへリダイレクト
    new_user_session_path
  end
end

Devise.setup do |config|

# 上で定義したCustomFailureクラスを設定
config.warden do |manager|
  manager.failure_app = CustomFailure
end

  # 送信元の表示名
  config.mailer_sender = 'タイトル名 <noreply@example.com>'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]

  config.strip_whitespace_keys = [:email]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 12

  config.reconfirmable = true

  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 6..128

  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  config.timeout_in = 3.minutes

  config.unlock_strategy = :email

  config.maximum_attempts = 4

  config.reset_password_within = 6.hours

  config.sign_out_via = :delete

end
