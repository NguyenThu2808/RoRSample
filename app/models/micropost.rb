class Micropost < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: Settings.maximum_content}
  validate :picture_size
  scope :micropost_desc, -> {order(created_at: :desc)}
  scope :micropost_id, -> (id){where user_id: id}

  private

  def picture_size
    if picture.size > (Settings.five_mb).megabytes
      errors.add :picture, I18n.t(".less_than_5MB")
    end
  end
end
