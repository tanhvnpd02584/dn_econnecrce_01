class Admin::PurchasesController < AdminsController
  before_action :find_purchase, only: :update

  def index
    @purchases = Purchase.sorted
                         .paginate(page: params[:page],
                                   per_page: Settings.per_page_user)
    respond_to do |format|
      format.html
      format.xls{send_data @purchases.to_xls(col_sep: "\t"), filename: "Purchase-#{Time.zone.today}.xlsx"}
    end
  end

  def update
    @purchase.toggle!(:status)
    flash[:success] = t "purchases.status_updated"
    redirect_to admin_purchases_url
  rescue => e
    flash[:danger] = t "purchases.status_cant_update"
    redirect_to admin_purchases_url
  end

  private

  def find_purchase
    @purchase = Purchase.find_by(params[:id])
    return if @purchase

    flash[:danger] = t "admin_purchases.text_not_found"
    redirect_to admin_purchases_url
  end
end
