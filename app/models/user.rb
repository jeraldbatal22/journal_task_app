class User < ApplicationRecord
  has_secure_password 
  
  has_many :tasks, dependent: :destroy
  has_many :journals, dependent: :destroy

  validates :username, :email, uniqueness: true
  validates :username, :firstname, :lastname, :email, presence: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "must be a valid email address"}
  validates :password, :confirmation => true,  length: { minimum: 8 }, presence: true, on: :create
  validates :password, :password_confirmation, presence: true, on: :create

end
