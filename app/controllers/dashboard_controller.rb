# frozen_string_literal: true

class DashboardController < ApplicationController
  layout 'application'

  before_action :authenticate_user!

  def defined_root_path
    if current_user
      case current_user.role
      when 'member'
        member_root_path
      when 'admin'
        admin_root_path
      end
    else
      unauthenticated_root_path
    end
  end

  include Pundit

  rescue_from Pundit::NotAuthorizedError do
    redirect_to defined_root_path, notice: t('global.access')
  end
end
