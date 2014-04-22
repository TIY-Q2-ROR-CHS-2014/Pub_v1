class Pub < ActiveRecord::Base
  has_many :drinks
  has_many :foods
  # But I love shit beers. ]:
  accepts_nested_attributes_for :drinks

end
