class Author < ActiveRecord::Base
  validates_uniqueness_of :last_name, :scope => [:first_name, :second_name]
  
  has_many :products
  before_save :save_full_name

  make_permalink :with => :full_name, :field => :permalink

  def to_param
    return permalink unless permalink.blank?
    full_name.to_url.to_s
  end

  def full_name
    return full_name unless @attributes[:full_name].blank?
    "#{last_name} #{first_name} #{second_name}"
  end

  def name_with_initials
    last_name + (initials.blank? ? '' : ' ' + initials)
  end

  private

  def initials
    initial(first_name) + initial(second_name)
  end

  def initial name
    unless name.blank?
      name[0..1] + '.'
    else
      ''
    end
  end

  def save_full_name
    self.attributes['full_name'] = "#{last_name} #{first_name} #{second_name}"
  end

  scope :by_name, :order => :last_name
end
