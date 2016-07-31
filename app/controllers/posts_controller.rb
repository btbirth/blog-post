class PostsController < ApplicationController
#index
	def index
		@posts = Post.all
	end
#show	
	def show
		@post = Post.find(params[:id])			
	end
#new
	def new
		@post = Post.new
	end
#edit	
	def edit
		@post = Post.find(params[:id])
	end
#update	
	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
    		redirect_to @post
  		else
   			render 'edit'
  		end
	end
#create
	def create
		@post = Post.new(post_params)
 
		@post.save
		redirect_to @post
	end
#delete
	def destroy
		  @post = Post.find(params[:id])
  @post.destroy
 
  redirect_to posts_path
		
	end






private
	def post_params
		params.require(:post).permit(:title, :author, :body, :image)
	end

end
