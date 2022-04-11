class CategoriesController < ApplicationController
  before_action :set_category, only: %i[edit update destroy]

  def index
    @categories = authorize policy_scope(Category).all
  end

  def new
    @category = policy_scope(Category).new
  end

  def edit
  end

  def create
    @category = authorize policy_scope(Category).new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_url, notice: t('.controller.create') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to categories_url, notice: t('.controller.update') }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy
    flash[:notice] = t('.controller.destroy')
    redirect_to categories_url
  end

  private

  def set_category
    @category = authorize policy_scope(Category).find(params[:id])
  end

  def category_params
    params.require(:category).permit(:category_name)
  end
end
