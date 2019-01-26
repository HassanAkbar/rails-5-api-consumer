class ContentsController < ApplicationController
  def index
    @contents = Rails.cache.fetch("published_contents", expires_in: 1.minute) do  
      Content.published
    end
    respond_to do |format|
      format.json { render json: @contents, each_serializer: ContentSerializer, status: 200 }
    end
  end
end