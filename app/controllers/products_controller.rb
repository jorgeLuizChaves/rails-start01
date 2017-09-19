class ProductsController < ApplicationController

  def index
      @products = Product.all.order :name\
  end

  def new
    @product = Product.new
    set_departments
  end

  def create

    @product = Product.new product_params
    if @product.save
      flash[:notice] = "Produto salvo com sucesso"
      redirect_to root_url
    else
      render_view :new
    end
  end

  def edit
    set_product
    @departments = Department.all
  end

  def update
    set_product
    if @product.update product_params
      flash[:notice] = "alterado com sucesso"
      redirect_to root_url
    else
      render_view :view
    end
  end

  def destroy
    set_product
    @product.destroy
    redirect_to root_url
  end

  def search
    @name = params[:nome]
    @products = Product.where "name like ?", "%#{@name}%"
  end

  private

  def set_product
    id = params[:id]
    @product = Product.find id
  end

  def set_departments
    @departments = Department.all
  end


  def render_view(view_name)
    @departments = Department.all
    render view_name
  end

  def product_params
    params.required(:product).permit :name, :description, :quantity, :price, :department_id
  end
  
end