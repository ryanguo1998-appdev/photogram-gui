class PhotoController < ApplicationController
  def index
    render({ :template => "photo_templates/index"})
  end

  def show
    this_photo_id = params.fetch("path_id")

    all_photos = Photo.all
    @this_photo = all_photos.where( :id => this_photo_id).at(0)

    all_comments = Comment.all.order( :created_at => :desc)
    @matching_comments = all_comments.where( :photo_id => this_photo_id)
    @num_comments = @matching_comments.length

    render({ :template => "photo_templates/show"})
  end
end