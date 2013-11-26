# -*- coding: utf-8 -*-
class PressesController < Spree::BaseController

  helper :products

  def accurate_title
    @press ? @press.full_name + ' - Купить книги' : nil
  end

  def show
    @press = Press.find(params[:id])
  end

end
