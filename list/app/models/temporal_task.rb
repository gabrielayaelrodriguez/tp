class TemporalTask < Task	
	validates :validation_start, presence: true
	validates :validation_end, presence: true

	validates :validation_start, date: { before: :validation_end }

	def should_appear?
		if self.validation_end< Date.today && self.state != 'Expired'
			self.state = 'Expired'
			self.save
			false
		else
			if self.state == 'Expired'
				false
			else
				true
			end
		end
	end
end
