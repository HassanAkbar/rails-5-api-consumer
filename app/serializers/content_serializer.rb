class ContentSerializer < ActiveModel::Serializer
  attributes :title, :author, :summary, :content
  attribute :published_date, key: 'published-date'
end
