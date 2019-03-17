class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :subjects, ->{order(:id)}, dependent: :destroy
  has_many :tasks, through: :subjects, dependent: :destroy
   
end
