# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = t('.controller.create')
      redirect_to @book
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @book.update(book_params)
      flash[:notice] = t('.controller.update')
      redirect_to @book
    else
      render 'edit'
    end
  end

  def show; end

  def destroy
    @book.destroy
    flash[:notice] = t('.controller.destroy')
    redirect_to books_url
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :description, :category, :price, publishing_house, :publishing_date, :cover,
                                 :language)
  end
end
