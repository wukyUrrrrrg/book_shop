# -*- coding: utf-8 -*-
class AuthorsController < Spree::BaseController
  # resource_controller

  helper :products

  def accurate_title
    @author ? @author.full_name + ' - Купить книги' : nil
  end

  def show
    @author = Author.find_by_permalink(params[:id])
  end

end
