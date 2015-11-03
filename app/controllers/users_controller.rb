class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_user, only: [:show, :destroy, :edit , :update]
	before_action :authorize_user, only: [:show, :destroy, :edit , :update]
	after_action :verify_authorized
	def index
		@users = UserPolicy::Scope.new(current_user, User).resolve
		
		#@users = User.all
		authorize User
	end

	def show
		
	end

	def update
		if @user.update_attributes(params_user)
			redirect_to users_path
		end
	end

	def edit
		
	end

	def destroy
		@user.destroy
		redirect_to users_path
	end

	protected
	def set_user
		puts params[:id]
		@user = User.find(params[:id])
	end

	def authorize_user
		authorize @user
	end

	private 
	def params_user
		params.require(:user).permit(:email)
	end

end
