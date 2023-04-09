class ApplicationController < ActionController::Base
  
  def new
  @book = Book.new
  end
  
  def create
    @book = Book.new(user_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path
  end  
  
  private

  def book_params
    params.require(:book).permit(:tetle, :image, :body)
  end
  
end