class UserController < ApplicationController
  def index
    render({ :template => "user_templates/index"})
  end

  def show
    @this_user = params.fetch("path_id")

    all_users = User.all
    matching_user = all_users.where( :username => @this_user).at(0)
    @user_id = matching_user.id

    all_photos = Photo.all
    @matching_photos = all_photos.where( :owner_id => @user_id)
    @num_photos = @matching_photos.length

    render({ :template => "user_templates/show"})
  end
end