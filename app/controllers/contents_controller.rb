class ContentsController < ApplicationController
  def index
    @contents = Content.published
    #binding.pry
    respond_to do |format|
      format.json { render json: @contents, each_serializer: ContentSerializer, status: 200 }
    end
  end
end