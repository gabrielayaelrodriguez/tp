class List < ApplicationRecord
	validates :name, presence: true
	validates :url, uniqueness: true

	before_validation(on: :create) do
		self.url=self.name.parameterize		
	end

end
