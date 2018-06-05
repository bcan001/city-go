module ApplicationHelper

	def basic_date_format(date)
		date.strftime("%A %B %d, %I:%M %p")
	end

end
