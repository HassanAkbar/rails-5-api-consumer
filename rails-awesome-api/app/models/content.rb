class Content < ApplicationRecord
  scope :published, -> { where(status: :published) }
  scope :draft, -> { where(status: :draft) }
end