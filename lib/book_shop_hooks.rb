class BookShopHooks < Spree::ThemeSupport::HookListener
  insert_after :admin_product_form_additional_fields do
    %(<%= render(:partial => "admin/products/special_properties", :locals => {:product => @product} ) %>) 
  end

  insert_after :admin_product_sub_tabs do
    %(<%= tab :authors, :match_path => '/authors' %>
      <%= tab :presses, :match_path => '/presses' %>
      <%= tab :product_series_index, :match_path => '/product_series' %>
)
  end

end
