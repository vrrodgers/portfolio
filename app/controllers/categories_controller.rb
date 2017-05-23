class CategoriesController < ApplicationController
  before_action :set_category, only: [ :edit, :show, :update, :destroy]
  
  def index
    @categories= Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category= Category.new(category_params)
    
    if @category.save
      redirect_to @category, notice: 'You just created the category'
    else
      render :new
    end
     
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:success] = "You just created the category"
      redirect_to category_path(@category)
    else
      render 'edit'
    end    
  end

  def destroy
    @category.destroy
    redirect_to root_path
  end
  private

  def set_category
    @category = Category.find(params[:id])
  end
  
  def  category_params
    params.require(:category).permit(:name)
  end  
end
