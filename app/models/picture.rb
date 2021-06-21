class Picture < ApplicationRecord
  has_one_attached :file

  validates :title, presence: true, length: { maximum: 30 }
  validate :valid_file

  private

  def valid_file
    errors.add(:file, "can't be blank.") unless file.attached?
  end
end
