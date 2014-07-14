class GamesController < ApplicationController

	def new
		games = Game.where(:active_game => true)

		if games.size() == 0
			@game = Game.new()
		else
			redirect_to :action => :end_one_game
		end
	end

	def create
		@game = Game.new(params[:game])
		@game.create_date = DateTime.now
		@game.active_game = true
		@game.save

		redirect_to :controller => 'drinks', :action => :index
	end

	def index
		@games = Game.all
		@users = User.all
	end

	def end_one_game
		@games = Game.where(:active_game => true)
		if @games.size() == 0
			redirect_to :action => :new
		else
			@game = @games.first()
			@drinks = Drink.all
		end
	end

	def close_this_game
		@games = Game.where(:active_game => true)
		@game = @games.first()

		puts "password error = " + params[:game][:password] + ":" + @game.password
		if params[:game][:password] == nil or !(params[:game][:password].eql? @game.password)
			flash[:alert] = "密碼不正確"
			redirect_to :action => :end_one_game
			puts "password error"
			return
		end

		if params[:game] == nil or params[:game][:drink_id] == nil
			flash[:alert] = "沒有選擇項目"
			redirect_to :action => :end_one_game
			return
		end

		answer = params[:game][:drink_id].to_i

		@game.active_game = false
		@game.drink_id = answer
		@game.end_date = DateTime.now

		# 比對選項跟答案 放正winner的空間中
		# 將所有的使用者的選項清空
		@users = User.all
		@users.each do |user|
			if user.drink_id != nil
				UserGameJoinship.create(:game_id => @game.id, :user_id => user.id)

				puts "user drink_id = " + user.drink_id.to_s + " v.s. " + answer.to_s
				if user.drink_id == answer
					puts "winner : " + user.name
					UserGameWinnership.create(:game_id => @game.id, :user_id => user.id)
				end
				user.drink_id = nil
				user.save
			end
		end

		@game.save

		drink = Drink.find(answer)
		drink.empty = true
		drink.save

		redirect_to :action => :new
	end
end
