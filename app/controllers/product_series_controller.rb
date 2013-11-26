# -*- coding: utf-8 -*-
class ProductSeriesController < Spree::BaseController

  helper :products

  def accurate_title
    @product_series ? @product_series.full_name + ' - Купить' : nil
  end

  def show
    @product_series = ProductSeries.find_by_permalink(params[:id])
  end

end
