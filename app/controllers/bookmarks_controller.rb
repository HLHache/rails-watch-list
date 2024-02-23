class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @movie = Movie.find(params[:movie_id])
    @bookmark = @list.bookmarks.new(movie: @movie)
  end

  def create
    @list = List.find(params[:list_id])
    @movie = Movie.find(params[:movie_id])
    @bookmark = @list.bookmarks.new(bookmark_params)
    @bookmark.movie = @movie
    if @bookmark.save
      redirect_to @list
    else
      render :new
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
