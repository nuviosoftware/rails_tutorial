class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all   
  end

  def show
    @profile = Profile.find(params[:id])   
  end

  def new
  end

  def create
  end

  def edit
    @profile = Profile.find(params[:id])   
  end

  def update
    @profile = Profile.find(params[:id])   
    if @profile.update_attributes(profile_params)   
      flash[:notice] = 'Profile updated!'   
      redirect_to root_path   
    else   
      flash[:error] = 'Failed to edit profile!'   
      render :edit   
    end   
  end

  def destroy
    @profile = Profile.find(params[:id])   
    if @profile.delete   
      flash[:notice] = 'Profile deleted!'   
      redirect_to root_path   
    else   
      flash[:error] = 'Failed to delete this profile!'   
      render :destroy   
    end   
  end

  def profile_params   
    params.require(:profile).permit(:name, :description, :email)   
  end   
   
end
