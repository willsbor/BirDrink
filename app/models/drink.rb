class Drink < ActiveRecord::Base
  attr_accessible :name, :empty
  has_many :users
  has_many :games
end
