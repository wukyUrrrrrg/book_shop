class Admin::AuthorsController < Admin::BaseController
  resource_controller
  # def collection
  #   @collection = []
  # end
  create.response do |wants|
    # go to edit form after creating as new author
    wants.html {redirect_to edit_admin_author_url(Author.find(@author.id)) }
  end

  update.response do |wants|
    # override the default redirect behavior of r_c
    # need to reload Author in case name / permalink has changed
    wants.html {redirect_to edit_admin_author_url(Author.find(@author.id)) }
  end

  def collection
    @search = end_of_association_chain.metasearch(params[:search])
    @collection = @search.relation.order('created_at DESC').paginate(:per_page  => Spree::Config[:admin_products_per_page],
                                                                     :page      => params[:page])

  end
end
