class Comment < ActiveRecord::Base
  belongs_to :product
  validates :comment, presence: true
  
  def self.with_p_name
  	self.joins(:product).select(:comment, "products.name as p_name")
  end

end
