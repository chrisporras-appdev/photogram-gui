class ApplicationController < ActionController::Base
  def list_users
    render({:template => "templates/users.html.erb"})
  end

  def insert_user
    username = params.fetch("user_input")
    u = User.new
    u.username = username
    u.save

    redirect_to("/users/#{username}")
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
    image_url = params.fetch("image_url")
    image_caption = params.fetch("image_caption")
    owner_id = params.fetch("owner_id")
    p = Photo.new
    p.image = image_url
    p.caption = image_caption
    p.owner_id = owner_id
    p.save

    redirect_to("/photos/#{p.id}")
  end

  def photo_details
    photo_id = params.fetch(:photo_id)
    @photo = Photo.where({:id => photo_id}).at(0)

    render({:template => "templates/photo_details.html.erb"})
  end

  def update_photo
    image_id = params.fetch(:photo_id)
    image_url = params.fetch("image_url")
    image_caption = params.fetch("image_caption")
    p = Photo.where({:id => image_id}).at(0)
    p.image = image_url
    p.caption = image_caption
    p.save

    redirect_to("/photos/#{image_id}")
  end

  def delete_photo
    photo_id = params.fetch(:photo_id)
    p = Photo.where({:id => photo_id}).at(0)
    p.destroy

    redirect_to("/photos", {:notice => "Deleted #{p.caption}."})
  end

  def add_comment
    com = Comment.new
    com.photo_id = params.fetch("photo_id")
    com.author_id = params.fetch("author_id")
    com.body = params.fetch("comment_body")
    com.save

    redirect_to("/photos/#{com.photo_id}")
  end
end
