class TemporalTask < Task	
	validates :validation_start, presence: true
	validates :validation_end, presence: true
end
