class List < ApplicationRecord
	has_many :tasks
	validates :name, presence: true
	validates :url, uniqueness: true

	before_validation(on: :create) do
		self.url=self.name.parameterize		
	end

	def to_param
		url
	end

end
