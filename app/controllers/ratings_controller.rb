class RatingsController < ApplicationController
    before_action :require_login
    before_action :find_rating
    before_action :owner?, only: [:edit, :destroy]
    before_action :existing_video, only: [:create]
  
      def index
          @ratings = Rating.latest
        end
      
        def show
        end
      
        def new
          @rating = Rating.new
          @rating.build_video
        end
      
        def create
          @rating = Rating.new(rating_params)
          @rating.user = current_user
          if @rating.save
          redirect_to rating_path(@rating), info: "Rating was Created!"
          else
            render :new
          end
        end
      
        def edit
          @videos = Video.all
        end
      
        def update
          @rating.user = current_user
          @rating.update(rating_params)
          if @rating.save
          redirect_to rating_path(@rating), info: "Rating was saved!"
          else
            render :edit
          end
        end
  
      def destroy
        Rating.find(params[:id]).destroy
        redirect_to ratings_path, info: "Rating was deleted!"
       end
      
        private
          def rating_params
            params.require(:rating).permit(
              :title,
              :body,
              :rating,
              :user_id,
              :video_id,
              video_attributes:[:title, :genre, :developer, :age, :year_released]
             )
      end
  end