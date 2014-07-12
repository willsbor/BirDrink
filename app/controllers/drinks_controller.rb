class DrinksController < ApplicationController

	def index
  		@drinks = Drink.all

  		games = Game.where(:active_game => true)

		if games.blank?
			redirect_to :controller => 'games', :action => :new
		else
			if cookies[:user_id]
	  			@users = User.where(:id => cookies[:user_id])
	  			if @users.blank?
					cookies.delete :user_id
	  				redirect_to :controller => 'users', :action => :new
	  			else
	  				@user = @users.first()
	  			end
	  		else
	  			redirect_to :controller => 'users', :action => :new
	  		end
		end
	end

	def sleep

	end
end
