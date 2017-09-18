class ProductsController < ApplicationController

  def index
      @products = Product.all.order :name
  end

  def new
    @product = Product.new
    @departments = Department.all
  end

  def create
    
    values = params.required(:product).permit :name, :description, :quantity, :price, :department_id
    @product = Product.new values
    if @product.save
      flash[:notice] = "Produto salvo com sucesso"
      redirect_to root_url
    else
      render :new
    end
  end

  def destroy
    id = params[:id]
    Product.destroy id
    redirect_to root_url
  end

  def search
    @name = params[:nome]
    @products = Product.where "name like ?", "%#{@name}%"
  end


end