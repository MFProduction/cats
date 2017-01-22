class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :funerals, dependent: :destroy
  validates :email, presence: true, uniqueness: true
end
