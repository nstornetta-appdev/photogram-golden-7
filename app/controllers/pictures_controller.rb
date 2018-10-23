class PicturesController < ApplicationController
    def list_of_photos
        @photo_list = Photo.all
        render("photos_templates/list.html.erb")
    end
    
    def add_photo
        render("photos_templates/add_photo.html.erb")
    end
    
    def photo_details
        @photo_for_details = Photo.find(params.fetch("photo_number"))
        render("photos_templates/photo_details.html.erb")
    end
    
    def create_photo
        new_photo = Photo.new
        new_photo.caption = params.fetch("caption")
        new_photo.source = params.fetch("image_url")
        new_photo.save
        @count = Photo.count
        redirect_to("/photos")
    end
    
    def edit_photo
        @photo = Photo.find(params.fetch("photo_number"))
        render("photos_templates/edit_photo.html.erb")
    end
    
    def update_photo
        @photo = Photo.find(params.fetch("photo_number"))
        @photo.caption = params.fetch("the_caption")
        @photo.source = params.fetch("the_source")
        @photo.save
        redirect_to("/photos/#{@photo.id}")
    end
    
    def delete_photo
        Photo.find(params.fetch("photo_number")).delete()
        @count = Photo.count
        redirect_to("/photos")
    end
    
    skip_before_action :verify_authenticity_token, raise: false
end
