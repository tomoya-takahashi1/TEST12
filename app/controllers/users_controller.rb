class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new

  end

  def create
    @user = User.new(params.require(:user).permit(:title,:start,:finish,:allday,:introduction))
    
       #以下のsaveメソッドで保存がされません
    if @user.save
      flash[:notice] = "ユーザーを新規登録しました"
      redirect_to :users
    else
      #こちらの処理が実行されます。
      flash[:alert] = "・ユーザー登録に失敗しました"
      render "users/new"
      
     
    end
  end

  def show
    @user = User.find(params[:id])
    
  end

  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
     if @user.update(params.require(:user).permit(:title,:start,:finish,:allday,:introduction))
       flash[:notice] = "ユーザーIDが「#{@user.id}」の情報を更新しました"
       redirect_to :users
     else
       render "edit"
     end
    
  end

  
  
  def destroy
    @user = User.find(params[:id])
     @user.destroy
     flash[:notice] = "ユーザーを削除しました"
     

     redirect_to :users
  end
end
