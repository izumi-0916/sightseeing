class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :spots
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liked_spots, through: :likes, source: :spot

  validates :name, presence: true, uniqueness: true
  validates :email, format: { with: /\A\S+@\S+\.\S+\z/ }
end
