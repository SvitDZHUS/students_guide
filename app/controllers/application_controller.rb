# frozen_string_literal: true

class ApplicationController < ActionController::Base
  layout :resolve_layout

  include Pundit

  before_action :set_locale

  private

  rescue_from Pundit::NotAuthorizedError do
    redirect_to root_path, notice: t('global.access')
  end

  def set_locale
    locale_in_cookies = I18n.available_locales.map(&:to_s).include?(cookies[:locale])
    I18n.locale = locale_in_cookies ? cookies[:locale] : I18n.default_locale
  end

  def resolve_layout
    if current_user&.admin?
      'admin'
    elsif current_user&.member?
      'member'
    else
      'application'
    end
  end
end
