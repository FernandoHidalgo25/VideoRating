class VideosController < ApplicationController
    before_action :require_login
    before_action :find_video
    before_action :admin?, only: [:new, :edit]
  
      def index
          @videos = Video.alphabetized
        end
      
        def show
        end
      
        def new
          @videos = Video.new
        end
      
        def create
          @videos = Video.create(game_params)
          if @videos.save
          redirect_to video_path(@videos), info: "Video was Created!"
          else
            render :new
          end
        end
      
        def edit
  
        end
      
        def update
          @videos.update(video_params)
          if @videos.save
          redirect_to video_path(@videos), info: "Video was Updated!"
        else
          render :edit
        end
      end
  
        private
          def video_params
            params.require(:video).permit(
              :title,
              :genre,
              :developer,
              :age,
              :year_released
           )
      end
  end
  