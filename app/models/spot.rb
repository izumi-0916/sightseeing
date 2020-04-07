class Spot < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to_active_hash :area, foreign_key: true

  validates_associated :images
  validates :images, presence: true
  validates :name,    presence: true
  validates :place,   presence: true
  validates :text,    presence: true
  validates :prefecture_id, numericality: { only_integer: true, greater_than: 0, less_than: 48 }


end
