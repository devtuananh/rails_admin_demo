class Post < ApplicationRecord
  belongs_to :user
  has_one :image, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :image, reject_if: proc {|attributes|
    attributes['image_url'].blank?}

  validates :title, presence: :true
  validates :content, presence: :true
end
