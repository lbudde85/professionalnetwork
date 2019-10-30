class BrandProfile < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true

  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment :logo, content_type: { content_type: ["image/jpeg", "image/png"] }
end
