class SpacesController < ApplicationController
  before_action :logged_in_user, only: %i[ show list]
  before_action :admin_user, only: %i[ destroy create edit update]

  def new
    @space = Space.new
  end

  def edit
    @space = Space.find(params[:id])
  end

  def update
    @space = Space.find(params[:id])
      begin
         @space.update_attribute(:space_name, params[:space][:space_name])
         @space.update_attribute(:ward_id, params[:space][:ward_id])
         @space.update_attribute(:price, params[:space][:price])
         flash[:success] = "Space Information Updated"
         redirect_to list_path
      rescue
    #if @space.update_attributes(space_params)
    #  flash[:success] = "Your Information Updated"
    #  redirect_to list_path
    #else

         render 'edit'
      end
  end

  def create
    @space = Space.new(space_params)
    if @space.save
        flash[:success] = "Success!! Add New Space"
        redirect_to list_path
      else
        render 'new'
    end
  end

  def show
    @space = Space.find(params[:id])
  end

  def list
    @space = Space.paginate(page: params[:page]).search(params[:search])
  end

  def destroy
    Space.find(params[:id]).destroy
    flash[:success] = "Space deleted"
    redirect_to list_path
  end

  private
    #def space_params
    #  params.require(:space).permit(:space_name, :ward_id, :price)
    #end

    def space_params
      params.require(:space).permit(:space_name, :ward_id, :price)
    end
end