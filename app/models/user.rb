class User < ActiveRecord::Base
  attr_accessible :drink_id, :name
  belongs_to :drink

  has_many :user_game_winnerships
  has_many :user_game_joinships
  has_many :joins, :through => :user_game_joinships, :source => :game
  has_many :winners, :through => :user_game_winnerships, :source => :game
end
