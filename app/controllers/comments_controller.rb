class CommentsController < ApplicationController

  def create
    # binding.pry
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype_id)#"/prototypes/#{comment.prototype_id}"
    else
      # binding.pry
      @prototype = Prototype.find(params[:prototype_id])
      @comments = @prototype.comments
      # @prototype = Prototype.find(params[:prototype_id])
      # binding.pry
      render "prototypes/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
