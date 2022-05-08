# frozen_string_literal: true

class WelcomePagesController < ApplicationController
  def welcome
    @latest_books = Book.latest_books(8)
  end
end
