class Micropost < ApplicationRecord
  belongs_to :user
  scope :created_at, ->{order created_at: :desc}
  validates :content, presence: true,
    length: {maximum: Settings.models.micropost.content_maximum}
end
