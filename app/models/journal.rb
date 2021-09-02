class Journal < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :name, uniqueness: true
  validates :name, :description, presence: true
  validates :description,  length: { minimum: 4 }
end
