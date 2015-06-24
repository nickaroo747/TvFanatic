class MoviesController < ApplicationController
    def index
        @movies = Movie.all
        @movie = Movie.new
    end

    def show
        @movie = Movie.find(params[:id])
        @review = Review.new

    end

    def edit
      @movie = Movie.find(params[:id])
    end

    def new
        @movie = Movie.new
    end

    def create
        @movie = Movie.new(params.require(:movie).permit(:title))

        if @movie.save
            redirect_to movies_path
        else
            render :new
        end
    end

    def update
      @movie = Movie.find(params[:id])
      if @movie.update(post_params)
        redirect_to @movie, notice: 'Post was successfully updated.'      
      else
        render :edit
      end
    end

    def destroy
      @movie = Movie.find(params[:id])
      @movie.destroy
      redirect_to movies_path, notice: 'Post was successfully destroyed.'
    end

    private
      # Never trust parameters from the scary internet, only allow the white list through.
      def post_params
        params.require(:movie).permit(:title)
      end
end
