class Content < ApplicationRecord
  scope :published, -> { where(status: :published) }
  scope :draft, -> { where(status: :draft) }
  #validates_presence_of :title, :created_by
end