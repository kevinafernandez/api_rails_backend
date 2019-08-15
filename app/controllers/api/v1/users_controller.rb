module Api::V1
  class UsersController < ApplicationController
    include Response
    before_action :set_user, only: [:show, :update, :destroy]
  
    # GET /users.json
    def index
      @users = User.all
      render json: serializer.new(@users)
    end
  
    # GET /users/1.json
    def show
      render json: serializer.new(@user)
    end
  
    # POST /users.json
    def create
      @user = User.new(user_params)
  
      if @user.save
        render json: serializer.new(@user)
      else
        render json: serializer.new(@user.errors), status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /users/1.json
    def update
      if @user.update(user_params)
        render json: serializer.new(@user)
      else
        render json: serializer.new(@user.errors), status: :unprocessable_entity
      end
    end
  
    # DELETE /users/1.json
    def destroy
      @user.destroy
      head :no_content 
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def user_params
        params.require(:user).permit(:name, :email, :description)
      end

      def serializer
        UserSerializer
      end

  end
end 
