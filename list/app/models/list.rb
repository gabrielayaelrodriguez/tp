class List < ApplicationRecord
	has_many :tasks, dependent: :destroy
	validates :name, presence: true
	validates :url, uniqueness: true

	before_validation(on: :create) do
		if !self.name.nil? 
			self.url=self.name.parameterize
		end		
	end

	def to_param
		url
	end

end
