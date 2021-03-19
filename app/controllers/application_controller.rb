class ApplicationController < ActionController::Base
    add_flash_types :info
    helper_method :current_user
    
    def current_user
        User.find_by(id: session[:user_id])
    end

    def require_login
        if !session[:user_id]
            redirect_to root_path, info: "You must be logged in!" 
        end
    end

    def find_user
        @user = User.find_by(id: params[:id])
    end

    def find_video
        @videos = Video.find_by(id: params[:id])
    end

    def find_rating
        @rating = Rating.find_by(id: params[:id])
    end

    def admin?
        redirect_to videos_path, info: "Only the admin may enter this page!" unless current_user.name == "Admin"
    end

    def owner?
        redirect_to videos_path, info: "Only the owner may enter this page!" unless current_user.id == @rating.user_id
    end

    def existing_video
        if params[:rating][:video_id] == nil   
            @rating.video = Video.find_by(title: params[:rating][:video_attributes][:title], developer: params[:rating][:video_attributes][:developer], year_released: params[:rating][:video_attributes][:year_released])
        end
    end
      
end