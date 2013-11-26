class Admin::ProductSeriesController < Admin::BaseController
  resource_controller
  # def collection
  #   @collection = []
  # end
  create.response do |wants|
    # go to edit form after creating as new product_series
    wants.html {redirect_to edit_admin_product_series_url(ProductSeries.find(@product_series.id)) }
  end

  update.response do |wants|
    # override the default redirect behavior of r_c
    # need to reload ProductSeries in case name / permalink has changed
    wants.html {redirect_to edit_admin_product_series_url(ProductSeries.find(@product_series.id)) }
  end

  def collection
    @search = end_of_association_chain.metasearch(params[:search])
    @collection = @search.relation.order('created_at DESC').paginate(:per_page  => Spree::Config[:admin_products_per_page],
                                                                     :page      => params[:page])

  end
end
