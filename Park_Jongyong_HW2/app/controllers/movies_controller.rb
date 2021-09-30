class MoviesController < ApplicationController

    def show
      id = params[:id] # retrieve movie ID from URI route
      @movie = Movie.find(id) # look up movie by unique ID
      # will render app/views/movies/show.<extension> by default
    end
     #ss
    def index
      @all_ratings = ['G','PG','PG-13','R']
      @sort = params[:sort]
      @selectrating = params[:ratings]
    
      if @sort.present?
        session[:sort] = @sort
      end
      if @selectrating.present?
        session[:ratings] = @selectrating
      end
      
      if (@selectrating.nil? && session[:ratings].nil?)
        @movies = Movie.with_ratings(@all_ratings).order(session[:sort])
        session[:ratings] = @selectrating
      elsif (@selectrating.nil? && !session[:ratings].nil?) || (@sort.nil? && !session[:sort].nil?)
        redirect_to movies_path("ratings" => session[:ratings], "sort" => session[:sort])
      else
        if !@selectrating.nil?
  
          @movies = Movie.with_ratings(@selectrating.keys).order(@sort)
        else
  
          @movies = Movie.with_ratings(@all_ratings).order(@sort)
        end
        if @sort == 'title'
          @hilite = 'title'
        elsif params[:sort]=='release_date'
          @hilite = 'release_date'
          
        end
        
        
      end
      
    

      
    end
    
    def new
      # default: render 'new' template
    end
  
    def create
      @movie = Movie.create!(movie_params)
      flash[:notice] = "#{@movie.title} was successfully created."
      redirect_to movies_path
    end
  
    def edit
      @movie = Movie.find params[:id]
    end
  
    def update
      @movie = Movie.find params[:id]
      @movie.update_attributes!(movie_params)
      flash[:notice] = "#{@movie.title} was successfully updated."
      redirect_to movie_path(@movie)
    end
  
    def destroy
      @movie = Movie.find(params[:id])
      @movie.destroy
      flash[:notice] = "Movie '#{@movie.title}' deleted."
      redirect_to movies_path
    end
  
    private
    # Making "internal" methods private is not required, but is a common practice.
    # This helps make clear which methods respond to requests, and which ones do not.
    def movie_params
      params.require(:movie).permit(:title, :rating, :description, :release_date)
    end
  end