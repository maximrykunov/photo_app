class VisitorsController < ApplicationController
  def index
    @latest_photos = Photo.order(id: :desc).limit(4)
  end
end
