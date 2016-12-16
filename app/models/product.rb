class Product < ActiveRecord::Base
  belongs_to :category
  has_many :comments, dependent: :destroy
  validates :name, :description, :pricing, presence: true
  validates :pricing, numericality: { only_float: true, greater_than_or_equal_to: 1.99}
  
  before_save do 
    self.name.capitalize!
  end

  def self.with_category
  	self.joins(:category).select(:id, :name, :description, :pricing, "categories.name as c_name")
  end
end