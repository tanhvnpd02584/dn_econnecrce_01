class Admin::PurchasesController < AdminsController
  def index
    @purchases = Purchase.sorted
                         .paginate(page: params[:page],
                                   per_page: Settings.per_page_user)
    respond_to do |format|
      format.html
      format.xls{send_data @purchases.to_xls(col_sep: "\t"), filename: "Purchase-#{Time.zone.today}.xls"}
    end
  end
end
