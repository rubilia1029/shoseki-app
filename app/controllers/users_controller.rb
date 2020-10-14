class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @favorite_books = @user.favorite_books
  end

  
end
