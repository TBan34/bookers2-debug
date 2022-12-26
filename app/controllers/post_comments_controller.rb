class PostCommentsController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    comment = current_user.post_comments.new(book_id: book.id)
    comment.book_id = book.id
    comment.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    book = Book.find(params[:book_id])
    comment = current_user.post_comments.find_by(book_id: book.id)
    comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
