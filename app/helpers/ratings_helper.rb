module RatingsHelper
    def new_or_update?
        if params[:video_id] != nil
            return params[:video_id]
        elsif @rating.video_id != nil
            return @rating.video_id
        end
    end

    def new_video?
        if new_or_update? == nil
           return true
        end
    end
    
    def rating_edit_owner?
        if @rating.user_id == session[:user_id]
            return link_to 'Edit This Rating?', [:edit, @rating] 
        end
    end

    def rating_delete_owner?
        if @rating.user_id == session[:user_id]
            return button_to "Delete", @rating, method: :delete 
        end
    end
end