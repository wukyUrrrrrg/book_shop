# -*- coding: utf-8 -*-
# add custom rake tasks here
namespace :book_shop do
  desc "Генерирует яваскрипт для показа случайного товара"
  task :js_show_random_product do
    @host = 'konzeptual.ru'
    require File.expand_path(File.join(Rails.root,"config/environment"))
    include ERB::Util  # this should look strange to you 
    include Rails.application.routes.url_helpers
    js_file = 'var konzeptual_ru_product_images = new Array();
var konzeptual_ru_product_images_link = new Array();
var konzeptual_ru_product_images_alt = new Array();
'
    index = 0
    Taxon.name_like("рекоменд").first.products.each do |product|
      unless product.images.blank? 
        js_file += "konzeptual_ru_product_images[#{index}] = \"#{path_to_url(product.images.first.attachment.url(:small, use_timestamp = false))}\";"
        js_file += "konzeptual_ru_product_images_link[#{index}] = \"#{product_url(product, :host => @host)}\";"
        js_file += "konzeptual_ru_product_images_alt[#{index}] = \"#{html_escape(product.name)}\";"
        index += 1
      end
    end

    js_file += '
      if (document.getElementById && document.createTextNode) {
      
      var the_div = document.getElementById("konzeptual_ru_rekommended_book");
      var ran_num = Math.floor(Math.random()*(konzeptual_ru_product_images.length));
      
      var the_HTML = "<a href=\""+konzeptual_ru_product_images_link[ran_num]+"\">";
      // image
      the_HTML += "<img src=\""+konzeptual_ru_product_images[ran_num]+"\" class=\"banner_imgs\" ";
      the_HTML += "alt=\""+konzeptual_ru_product_images_alt[ran_num]+"\" /></a><br />";
      // text
      the_HTML += "<a href=\""+konzeptual_ru_product_images_link[ran_num]+"\" />";
      the_HTML += konzeptual_ru_product_images_alt[ran_num]+"</a>";
      the_div.innerHTML = the_HTML;
    }'
    puts js_file
  end

  def path_to_url(path)
    "http://#{@host.sub(%r[^http://],'')}/#{path.sub(%r[^/],'')}"
  end

end
