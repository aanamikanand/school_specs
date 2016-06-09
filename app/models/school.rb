class School < ActiveRecord::Base
	has_many :classrooms, dependent: :destroy
	
	validates_presence_of :name, :year_built, :rating

	def name_year_built
		"#{name} is built in: #{year_built}"
	end

	def school_rating
		if (rating <= 6)
			"Not a good school"
		elsif (rating <= 10)
			"Good school"
		else (rating > 10 )
			"School Rating ranges from 1 to 10"
		end
	end
end
