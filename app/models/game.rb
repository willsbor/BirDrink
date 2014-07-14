class Game < ActiveRecord::Base
  attr_accessible :create_date, :end_date, :active_game, :drink_id, :password

  belongs_to :drink
  has_many :user_game_winnerships
  has_many :user_game_joinships
  has_many :joins, :through => :user_game_joinships, :source => :user
  has_many :winners, :through => :user_game_winnerships, :source => :user
end
