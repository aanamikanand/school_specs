class Classroom < ActiveRecord::Base
	belongs_to :school
	validates_presence_of :name, :code
	validates :active, inclusion: {in: [true, false]} 

	def classroom_code
		"#{name} has code: #{code}"
	end

	def classroom_active
		if(active == false)
			"Class not active"
		else
			"class active"
		end
	end
end
