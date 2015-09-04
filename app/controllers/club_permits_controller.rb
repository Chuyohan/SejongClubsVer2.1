class ClubPermitsController < ApplicationController

	def create
		@club = Club.find(params[:id])
		@club.permit = true
		@club.save
	end
end
