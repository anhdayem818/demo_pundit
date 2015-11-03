class PostPolicy
	attr_reader :current_user, :model
	
	def initialize(current_user, model)
		@current_user = current_user || User.new
		@post = model	
	end

	def edit?
		@current_user.admin? || @current_user == @post.user
	end

	def update?
		@current_user.admin? || @current_user == @post.user
	end

	def destroy?
		@current_user.admin? || @current_user == @post.user
	end


end