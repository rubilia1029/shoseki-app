class BooksController < ApplicationController
  def index
    @books = Book.all.order('created_at DESC')
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
end
