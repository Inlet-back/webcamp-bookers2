class BooksController < ApplicationController
  def new

  end

def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
   if @book.save
      # 3. フラッシュメッセージを定義し、詳細画面へリダイレクト
      flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book.id)

  else
     @books = Book.all
   render :index
 end
end



  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @book_comment = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])
       user = @book.user
  unless user.id == current_user.id
    redirect_to books_path
  end
  end

  def update
    @book = Book.find(params[:id])
    user = @book.user
  unless user.id == current_user.id
    redirect_to books_path
  end
    if @book.update(book_params)
       flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)
   else
    render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
