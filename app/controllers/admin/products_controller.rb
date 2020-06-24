class Admin::ProductsController < AdminsController
  before_action :logged_in_user, :find_category, only: :create

  def index; end

  def new
    @product = Product.new
  end

  def create
    if @category.products.create product_params
      flash[:success] = t "products.text_success_product"
      redirect_to admin_root_url
    else
      render :new
    end
  end

  private

  def find_category
    @category = Category.find_by(product_params[:category_id])
    return if @category

    flash[:danger] = t "products.text_error_category"
    redirect_to :new
  end

  def product_params
    params
      .require(:product)
      .permit(:name, :unit_price, :quantity, :image, :category_id, :description)
  end
end
