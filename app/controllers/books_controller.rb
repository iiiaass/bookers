class BooksController < ApplicationController
  def new
  end

  def index
   @book=Book.new
   @books=Book.all
  end

  def show
   @books=Book.find(params[:id])
  end

  def create
     @book=Book.new(book_params)
     if @book.save
     redirect_to book_path(@book.id), notice:'Book was successfully created.'
     else
     @books=Book.all
     render:index
   end

  end


  def edit
    @book=Book.find(params[:id])
  end

  def update
    @book=Book.find(params[:id])
     if @book.update(book_params)
    redirect_to book_path(@book.id), notice:'Book was successfully updated.'
  else
    render:edit
  end
end




  def destroy
    @books=Book.find(params[:id])
    @books.destroy
    redirect_to books_path
  end


  private
  def book_params
    params.require(:book).permit(:title,:body)
  end


end
