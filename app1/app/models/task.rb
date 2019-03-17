class Task < ApplicationRecord
  belongs_to :subject
  
  validates :name, presence: true, length: { in: 2..300 }
    
end
