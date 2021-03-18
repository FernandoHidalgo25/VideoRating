module VideosHelper
    def admin_perms_new_video
        if session[:name] == "Admin"
            return link_to 'Admin, Create A Video Here', new_video_path 
        end
    end

    def admin_perms_edit_video
        if session[:name] == "Admin"
            return link_to 'Admin, Edit This Video Here', [:edit, @videos] 
        end
    end
end
