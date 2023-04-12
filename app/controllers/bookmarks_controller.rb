class BookmarksController < ApplicationController

  before_action :set_bookmark, only: :destroy
  before_action :set_list, only: %i[new create]

  def new
    # @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    # @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list), notice: 'Bookmark was successfully added.'
    else
      render "new", status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :list_id, :movie_id)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
