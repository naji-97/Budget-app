class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.includes(:author).where(author: current_user)
    # @category = Category.new
  end

  def show
    # @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params.merge(author: current_user))
    if @category.save
      redirect_to categories_path, notice: 'Category created successfully.'
    else
      render :new, alert: 'An error occured while creating a new category'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
