class BooksController < ApplicationController
  before_action :move_to_new, except: [:index, :show]
  
  def index
    @books = Book.all.order('created_at DESC')
    book_fav_count = Book.joins(:favorites).group(:book_id).count
    book_fav_ids = Hash[book_fav_count.sort_by{ |_, v| -v }].keys
    @book_ranking = Book.where(id:book_fav_ids).limit(5)
  end  

  def new
    @book = Book.new
  end
  
  def create
    @book = Book.create(book_params)
    if @book.valid?
      @book.save
      redirect_to books_path
    else
      render :new
    end  
  end
  
  def show
    @book = Book.find(params[:id])
    @comment = Comment.new
    @comments = @book.comments.order(created_at: :DESC)
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      redirect_to books_path
    else
      redirect_to book_path
    end
  end


  private

  def book_params
    params.require(:book).permit(:name, :author, :category_id, :image, :user_id).merge(user_id: current_user.id)
  end

  def move_to_new
    redirect_to new_user_session_path unless user_signed_in?
  end
end
