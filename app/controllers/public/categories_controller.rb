class Public::CategoriesController < ApplicationController
  before_action :authenticate_end_user!

  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @q = @category.rooms.ransack(params[:q])
    @rooms = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(10)
  end
end
