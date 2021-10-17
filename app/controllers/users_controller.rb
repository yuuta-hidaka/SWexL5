class UsersController < ApplicationController
    def index
        @users = User.all
    end
    def new
        @user = User.new
    end
    def create
        uid= params[:user][:uid]
        pass= params[:user][:pass]
        $login_password = BCrypt::Password.create(pass)
        @user = User.new(uid: uid,pass: $login_password)
        if @user.save
            flash[:notice] = 'ユーザー登録しました'
            redirect_to users_path
        else
            render'new'
            redirect_to root_path
        end
    end
    def destroy
        user = User.find(params[:id])
        user.destroy
        redirect_to users_path
    end
end
