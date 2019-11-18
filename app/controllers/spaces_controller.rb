class SpacesController < ApplicationController
  before_action :logged_in_user, only: %i[ edit update]
  before_action :admin_user, only: %i[ destroy]
  before_action :correct_user, only: %i[ edit update]

  def new
    @space = Space.new
  end

  def edit
    @space = Space.find(params[:id])
  end

  def update
    @space = Space.find(params[:id])
    if @space.update_attributes(space_params)
      flash[:success] = "Space Information Updated"
      redirect_to list_path
    else
      render 'edit'
    end
  end

  def create
    @space = Space.find(params[:id])
    if @space.update_attributes(space_params)
      flash[:success] = "Space Information Updated"
      redirect_to @space
    else
      render 'edit'
    end
  end

  def space_params
    params.require(:space).permit(:space_name, :ward_id, :price)
  end

  def show
    @space = Space.find(params[:id])
  end

  def list
    @space = Space.paginate(page: params[:page]).search(params[:search])
  end

  def destroy
  end

  def update
    @space = Space.find(params[:id])
    if @space.update_attributes(space_params)
      flash[:success] = "Space Information Updated"
      redirect_to @space
    else
      render 'edit'
    end
  end
end
