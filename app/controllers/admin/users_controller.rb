# -*- encoding : utf-8 -*-
class Admin::UsersController < Admin::BaseController  
  before_filter :authenticate_user!
  def index
    @users = User.all
  end

  def show
    @user = User.friendly.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to :admin_users, notice: t("flash.admin.users.create.notice")
    else
      render :new, alert: t("flash.admin.users.create.alert")
    end
  end

  def edit
    @user = User.friendly.find(params[:id])
  end

  def update
    @user = User.friendly.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to :admin_users, notice: t("flash.admin.users.update.notice")
    else
      render :edit, alert: "erro!"
    end
  end

  def destroy
    @user = User.friendly.find(params[:id])    
    if @user.destroy
      redirect_to admin_users_path, notice: t("flash.admin.users.destroy.notice")
    else
      redirect_to [:admin, @user], alert: t("flash.admin.users.destroy.alert")
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :avatar, :role)
  end

end