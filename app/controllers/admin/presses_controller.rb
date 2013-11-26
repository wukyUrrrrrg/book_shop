class Admin::PressesController < Admin::BaseController
  resource_controller
  # def collection
  #   @collection = []
  # end
  create.response do |wants|
    # go to edit form after creating as new press
    wants.html {redirect_to edit_admin_press_url(Press.find(@press.id)) }
  end

  update.response do |wants|
    # override the default redirect behavior of r_c
    # need to reload Press in case name / permalink has changed
    wants.html {redirect_to edit_admin_press_url(Press.find(@press.id)) }
  end

  def collection
    @search = end_of_association_chain.metasearch(params[:search])
    @collection = @search.relation.paginate(:per_page  => Spree::Config[:admin_products_per_page],
                                             :page      => params[:page])

  end
end
