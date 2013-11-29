class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  before_action :set_locale
  before_action :basic_auth if Rails.env.staging?

  private
  def set_locale
    I18n.locale = extract_locale_from_accept_language_header
    update_locale
  end

  def update_locale
    return unless user_signed_in?
    return if current_user.locale == I18n.locale.to_s
    current_user.update_column(:locale, I18n.locale.to_s)
  end

  def extract_locale_from_accept_language_header
    http_accept_language = request.env['HTTP_ACCEPT_LANGUAGE']
    if http_accept_language.present?
      http_accept_language.scan(/^[a-z]{2}/).first
    else
      :en
    end
  end

  def catch_not_found
    render layout: false, file: "#{Rails.root}/public/404.html", status: 404
  end

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |user,pass|
      user == 'welove' && pass == 'welovedayo'
    end
  end
end
