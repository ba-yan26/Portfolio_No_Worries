class Public::CategoriesController < ApplicationController
  def show
    @categories = Category.all
    @rooms = Room.all
  end
end
