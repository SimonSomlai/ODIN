class CommentsController < ApplicationController
	
	def create
		@comment = Comment.new(comments_params)
		@comment.article_id = params[:article_id]
		@comment.save
		redirect_to article_path(@comment.article)
	end

	def comments_params
		params.require(:comment).permit(:author_name, :body)
	end

	def edit
		
	end

	def update
	    @comment = Comment.find(params[:id])
	    @comment.update(comment_params)
	    redirect_to article_path(@comment.article)
  	end

	def destroy 

	end
end
