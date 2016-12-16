class ProductsController < ApplicationController
  def index
  	@product = Product.with_category
  end

  def new
  	@category = Category.all
  end

  def create
  	product = Product.new(product_params)
  	if product.save
  	  redirect_to :root
  	else
  	  flash[:errors] = product.errors.full_messages
      redirect_to :back
     end
  end

  def show
  	@product = Product.with_category.find(params[:id])
  	# @category = Product.joins(:category).select(:id, :name, :description, :pricing, "categories.name as c_name") 					MOVED to Product model as custom method!
  	@comments = Comment.all
  end

  def edit
    @product = Product.with_category.find(params[:id])
    @category = Category.all
  end

  def update
    product = Product.find(params[:id])
    # product.update(params[:id], category_id: params[:category_id], name: params[:name], description: params[:description], pricing: params[:pricing])
    product.update(product_params)    
    if (product.save)
	    redirect_to "/products/#{params[:id]}"
	  else
		flash[:errors] = product.errors.full_messages
		redirect_to :back
	  end
  end

  def delete
  	Product.find(params[:id]).delete
  	redirect_to :root
  end

  private
  def product_params
  	params.require(:productform).permit(:category_id, :name, :description, :pricing)
  end


end











# <%= select_tag :state, options_for_select(us_states) %>
