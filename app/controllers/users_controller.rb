class UsersController < ApplicationController

	def new
		if cookies[:user_id]
			redirect_to :controller => 'drinks', :action => :index
		else
			@user = User.new
		end
	end

	def create
	  	puts params
		if params[:user][:name].eql? ""
			flash[:alert] = "請輸入名字"
			redirect_to :action => :new
		else
			oldUsers = User.where(:name => params[:user][:name])

			if oldUsers.blank?
				user = User.new(params[:user])
				user.save
			else
				user = oldUsers.first
			end

			cookies[:user_id] = user.id
			#puts cookies[:user_id]
			redirect_to :controller => 'drinks', :action => :index
		end
	end

    def logout_new
		cookies.delete :user_id
		redirect_to :action => :new
    end

	def choise
		puts params

		if params[:user] == nil or params[:user][:drink_id].eql? ""
			flash[:alert] = "沒有選擇項目"
		else
			@user = User.find(cookies[:user_id])
			@user.drink_id = params[:user][:drink_id]
			@user.save
		end
		redirect_to :controller => 'drinks', :action => :index
	end

protected
	def user_info_params
    	params.require(:user).permit(:name)
  	end

end
