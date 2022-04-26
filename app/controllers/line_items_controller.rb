class LineItemsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @line_item = LineItem.create!(cart_id: current_user.cart.id, book_id: @book.id, price: @book.price)
    flash[:notice] = t('.controller.create')
    #redirect_to current_cart_url
  end
end
