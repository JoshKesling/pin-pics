class Pin < ApplicationRecord
  belongs_to :user

  has_attached_file :image, styles: { medium: '300x300>' }
  
  validates_attachment_content_type :image, content_type: /\Aimage/
  validates_attachment_file_name :image, matches: [/png\z/, /jpe?g\z/]
end
