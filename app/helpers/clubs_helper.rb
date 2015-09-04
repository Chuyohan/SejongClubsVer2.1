module ClubsHelper
	def club_permit?
		if (@club.permit == true)
			return true
		else
			return false
		end
	end
end
