class TemporalTask < Task	
	validates :validation_start, presence: true
	validates :validation_end, presence: true

	def should_appear?
		if self.validation_end< Date.today
			self.state = 'Expired'
			false
		else
			true
		end
	end
end
