class ProductSeries < ActiveRecord::Base
  validates_uniqueness_of :name
  has_many :products

  def full_name
    name
  end

  def to_param
    return permalink unless permalink.blank?
    name.to_url.to_s
  end

  make_permalink :with => :full_name, :field => :permalink

  scope :by_name, :order => :name

end
