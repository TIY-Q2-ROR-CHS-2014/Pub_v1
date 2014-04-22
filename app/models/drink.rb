class Drink < ActiveRecord::Base
  belongs_to :pub

  SHIT_BEERS = ["Bud Light", "Miller Light", "Budweiser"]
  # validates :name, presence: true, if: method_call_here
  validate :validate_shit_beers
  # def self.hello_world
  #   puts "Hello world"
  # end
  # Drink.hello_world

  attr_accessor :in_edit
  validate :validate_cost_in_edit

  def validate_shit_beers
    if Drink::SHIT_BEERS.include?(self.name)
      errors.add(:name, "can not be #{Drink::SHIT_BEERS.join(', ')}")
    end
  end
  # @drink.validate_shit_beers

  def validate_cost_in_edit
    puts self.inspect
    puts self.in_edit
  end
end
