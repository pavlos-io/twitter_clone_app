class MembersController < ApplicationController

	before_filter :authenticate_member!

	def index
		
	end

	def show
    	@member = current_member
  	end
end
