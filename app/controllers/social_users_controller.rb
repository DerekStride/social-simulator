# SocialUsersController
class SocialUsersController < ApplicationController
  before_action :set_social_user, only: [:show, :edit, :update, :destroy]

  # GET /social_users
  # GET /social_users.json
  def index
    @social_users = SocialUser.all
  end

  # GET /social_users/1
  # GET /social_users/1.json
  def show
  end

  # GET /social_users/new
  def new
    @social_user = SocialUser.new
  end

  # GET /social_users/1/edit
  def edit
  end

  # POST /social_users
  # POST /social_users.json
  def create
    @social_user = SocialUser.new(social_user_params)

    respond_to do |format|
      if @social_user.save
        format.html { redirect_to @social_user, notice: 'Social user was successfully created.' }
        format.json { render :show, status: :created, location: @social_user }
      else
        format.html { render :new }
        format.json { render json: @social_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /social_users/1
  # PATCH/PUT /social_users/1.json
  def update
    respond_to do |format|
      if @social_user.update(social_user_params)
        format.html { redirect_to @social_user, notice: 'Social user was successfully updated.' }
        format.json { render :show, status: :ok, location: @social_user }
      else
        format.html { render :edit }
        format.json { render json: @social_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /social_users/1
  # DELETE /social_users/1.json
  def destroy
    @social_user.destroy
    respond_to do |format|
      format.html { redirect_to social_users_url, notice: 'Social user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_social_user
    @social_user = SocialUser.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def social_user_params
    params.require(:social_user).permit(:name)
  end
end
