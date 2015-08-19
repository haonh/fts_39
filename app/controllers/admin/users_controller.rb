class Admin::UsersController < ApplicationController
  load_and_authorize_resource
  
  def index
    @search = User.search params[:q]
    @users = @search.result.paginate page: params[:page], per_page: Settings.per_page
    @search.build_condition if @search.conditions.empty?
    @search.build_sort if @search.sorts.empty?
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "admin.update_user_successfull"
    else
      flash[:failed] = t "admin.update_user_failed"
    end
    respond_to do |format|
      format.html {redirect_to admin_root_url}
      format.js
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "admin.destroy_user_successfull"
    else
      flash[:failed] = t "admin.destroy_user_failed"
    end
    respond_to do |format|
      format.html {redirect_to admin_root_url}
      format.js
    end
  end

  private
  def user_params
    params.require(:user).permit :admin
  end
end
