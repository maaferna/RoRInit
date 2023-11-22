class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Add any other attributes you need for your user model, e.g., 'username':
  attr_accessor :username
  
  has_one :user_profile
end
