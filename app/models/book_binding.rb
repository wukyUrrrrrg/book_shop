class BookBinding < ActiveRecord::Base
  has_many :products
  attr_accessible :name

  def full_name
    name
  end

  scope :by_name, :order => :name

end
