class TemporalTask < Task	
	validates :validation_start, presence: true
	validates :validation_end, presence: true

	before_save do
		if self.validation_end < Date.today
			changeState
		end
	end

	validates :validation_start, date: { before: :validation_end }

	def should_appear?

		#&& self.state!= 'Expired' could not be if i want to show expired tasks in that range

		if (self.validation_start < Date.today) && (self.validation_end > Date.today) && self.state != 'Expired'
			true
		elsif
			self.validation_end < Date.today && self.state != 'Expired'
			changeState
			self.save
			false
		else
			if self.state == 'Expired'
				false
			end
		end
	end

	def changeState
		self.state = 'Expired'	
	end

end
