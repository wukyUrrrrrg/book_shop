class Press < ActiveRecord::Base
  validates_uniqueness_of :name
  
  has_many :products

  def full_name
    name
  end

  scope :by_name, :order => :name

end
