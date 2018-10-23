Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  get("/", { :controller => "pictures", :action => "list_of_photos" })
  
  get("/photos", { :controller => "pictures", :action => "list_of_photos" })
  
  get("/photos/new", { :controller => "pictures", :action => "add_photo" })
  
  get("/photos/:photo_number", { :controller => "pictures", :action => "photo_details" })
  
  get("/create_photo", { :controller => "pictures", :action => "create_photo"})
  
  get("/photos/:photo_number/edit", { :controller => "pictures", :action => "edit_photo" })
  
  get("/update_photo/:photo_number", { :controller => "pictures", :action => "update_photo" })
  
  get("/delete_photo/:photo_number", { :controller => "pictures", :action => "delete_photo" })
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
