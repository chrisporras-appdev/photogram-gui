Rails.application.routes.draw do

  get("/", {:controller => "application", :action => "list_users"})

  get("/users", {:controller => "application", :action => "list_users"})

  get("/users/:username", {:controller => "application", :action => "user_details"})

  get("/insert_user", {:controller => "application", :action => "insert_user"})

  get("/update_user/:user_id", {:controller => "application", :action => "update_user"})

  get("/photos", {:controller => "application", :action => "list_photos"})

  get("/insert_photo", {:controller => "application", :action => "insert_photo"})

  get("/photos/:photo_id", {:controller => "application", :action => "photo_details"})

  get("/update_photo/:photo_id", {:controller => "application", :action => "update_photo"})

  get("/delete_photo/:photo_id", {:controller => "application", :action => "delete_photo"})

  get("/add_comment", {:controller => "application", :action => "add_comment"})
  
  # ======== Routes for Admin Dashboard =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
