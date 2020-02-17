Rails.application.routes.draw do

  get("/", {:controller => "application", :action => "list_users"})

  get("/users", {:controller => "application", :action => "list_users"})

  get("/users/:username", {:controller => "application", :action => "user_details"})

  get("/insert_user", {:controller => "application", :action => "insert_user"})

  get("/update_user/:user_id", {:controller => "application", :action => "update_user"})

  get("/photos", {:controller => "application", :action => "list_photos"})

  get("/photos/")

  get("/photos/:photo_id", {:controller => "application", :action => "photo_details"})

  
  # ======== Routes for Admin Dashboard =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
