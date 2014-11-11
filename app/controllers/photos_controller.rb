class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
  end

  def show
    @id = params[:id]
    pic = Photo.find_by({:id => params[:id]})
    @source = pic.source
    @caption = pic.caption
    render 'show'
  end

  def new_form
  end

  def create_row
    photo = Photo.new
    photo.source = params[:source]
    photo.caption = params[:caption]
    photo.save
    render 'create_row'
  end

  def destroy
    photo = Photo.find(params[:id])
    photo.destroy
    render 'delete'
  end

  def edit_form
    @photo = Photo.find(params[:id])
  end

  def update_row
    @photo = Photo.find(params[:id])
    @photo.source = params[:source]
    @photo.caption = params[:caption]
    @photo.save
    render 'update_row'
  end
end
