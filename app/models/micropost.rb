class Micropost < ApplicationRecord
  belongs_to :user
  scope :created_at, ->{order created_at: :desc}
  mount_uploader :picture, PictureUploader
  validates :content, presence: true,
    length: {maximum: Settings.models.micropost.content_maximum}
  validate  :picture_size

  private

  def picture_size
    return unless picture.size > Settings.models.micropost.image_size.megabytes
    errors.add :picture, t(".should_be")
  end
end
