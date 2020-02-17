class ApplicationController < ActionController::Base
  def list_users
    render({:template => "templates/users.html.erb"})
  end

  def insert_user
    username = params.fetch("user_input")
    u = User.new
    u.username = username
    u.save

    redirect_to("/users")
  end

  def update_user
    user_id = params.fetch(:user_id)
    username = params.fetch("user_input")
    u = User.where({:id => user_id}).at(0)
    u.username = username
    u.save

    redirect_to("/users/#{username}")
  end

  def user_details
    username = params.fetch(:username)
    @user = User.where({:username => username}).at(0)

    render({:template => "templates/user_details.html.erb"})
  end

  def list_photos
    render({:template => "templates/photos.html.erb"})
  end

  def insert_photo

  end

  def photo_details
    photo_id = params.fetch(:photo_id)
    @photo = Photo.where({:id => photo_id}).at(0)

    render({:template => "templates/photo_details.html.erb"})
  end
end
