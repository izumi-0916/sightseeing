class Comment < ApplicationRecord
  belongs_to :spot
  belongs_to :user 

  validates :title, presence: true
  validates :text, presence: true
end
