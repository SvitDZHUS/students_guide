# frozen_string_literal: true

class ShelvesController < DashboardController
  def show
    @shelf = authorize Shelf.find(params[:id])
  end
end
