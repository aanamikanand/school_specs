class Classroom < ActiveRecord::Base
	belongs_to :school
	validates_presence_of :name, :code

	def classroom_code
		"#{name} has code: #{code}"
	end

	def status
		self.active ? 'Active' : 'Not Active'
	end
end
