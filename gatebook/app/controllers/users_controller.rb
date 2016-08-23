class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

# GET /users
# GET /users.json
def index
    @users = User.all
end

# GET /users/1
# GET /users/1.json
def show
    @notes = @user.notes
end

# GET /users/new
def new
    @user = User.new
end

# GET /users/1/edit
def edit
end

# POST /users
# POST /users.json
def create
    @user = User.new(user_params)

    if @user.save
        redirect_to @user, notice: 'ユーザーが保存されました'
    else
        render :new
    end
end
end

# PATCH/PUT /users/1
# PATCH/PUT /users/1.json
def update
        if @user.update(user_params)
           redirect_to @user, notice: 'ユーザー情報が更新されました'
        else
            render :edit
        end
    end
end

# DELETE /users/1
# DELETE /users/1.json
def destroy
    @user.destroy
    redirect_to users_url ,notice: 'ユーザーが削除されました'
    end
end

private
# Use callbacks to share common setup or constraints between actions.
def set_user
    @user = User.find(params[:id])
end

# Never trust parameters from the scary internet, only allow the white list through.
def user_params
    params.require(:user).permit(:name, :email)
end
end
