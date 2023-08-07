class CategoriesController < ApplicationController
  before_action :authenticate_user!


  def index
    @categories = current_user.categories
  end

  def create
    @category = current_user.categories.new(category_params)
    if @category.save
      redirect_to categories_path, notice: 'Category created successfully.'
    else
      render :new
    end
  end

end
