class Subject < ApplicationRecord
  has_many :tasks, ->{order(:id)}, dependent: :destroy
  belongs_to :user
  
  validates_presence_of :name, :kind
  
end
