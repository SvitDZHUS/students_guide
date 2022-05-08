# frozen_string_literal: true

class BooksController < DashboardController
  def index
    @books = authorize Book.all
  end

  def show
    @book = authorize Book.find(params[:id])
  end
end
