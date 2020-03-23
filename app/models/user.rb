class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :spots

  validates :name, presence: true, uniqueness: true
  validates :email, format: { with: /\A\S+@\S+\.\S+\z/ }
end
