class BooksController < ApplicationController
  def new

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to user_path
 end



  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy

  end

  private

  def book_params
    params.require(:book).permit(:title, :image, :body)
  end

end
