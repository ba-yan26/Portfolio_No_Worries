class Public::CategoriesController < ApplicationController

  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @rooms = @category.rooms
  end
end
