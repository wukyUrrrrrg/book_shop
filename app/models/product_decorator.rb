Product.class_eval do 
  belongs_to :author
  belongs_to :press
  belongs_to :product_series
  belongs_to :book_binding

end
