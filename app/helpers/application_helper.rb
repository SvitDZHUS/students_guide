# frozen_string_literal: true

module ApplicationHelper
  def current_locale?(locale)
    I18n.locale == locale
  end
end
