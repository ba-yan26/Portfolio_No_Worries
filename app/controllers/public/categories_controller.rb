class Public::CategoriesController < ApplicationController

  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @q = @category.rooms.ransack(params[:q])
    @rooms = @q.result(distinct: true).order(created_at: :desc)
  end
end
