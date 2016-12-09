class Task < ApplicationRecord
  belongs_to :list
  validates :description, presence: true


  def <=>(another_task)

  	if self.priority=="High"
  		aux=1
  	elsif self.priority=="Medium"
  		aux=2
  	else
  		aux=3
  	end

  	if another_task.priority=="High"
  		auxanother=1
  	elsif another_task.priority=="Medium"
  		auxanother=2
  	else
  		auxanother=3
  	end

  	aux<=>auxanother

	end
end
