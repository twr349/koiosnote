class TopicsController < ApplicationController
    
    def index
        @topics = Topic.all
    end
    
    def show
        @topic = Topic.find(params[:id]) 
    end
    
    def new
        @topic = Topic.new
    end
    
    def create
        @topic = Topic.new
        @topic.title = params[:topic][:title]
        @topic.body = params[:topic][:body]
        #@topic.user = current_user
        
        if @topic.save
            flash[:notice] = "Topic was saved."
            redirect_to @topic
        else
            flash[:alert] = "An error saving the topc has occurred. Please try again."
            render :new
        end
    end
    
    def edit
        @topic = Topic.find(params[:id])
    end
    
    def update
        @topic = Topic.find(params[:id])
        @topic.title = params[:topic][:title]
        @topic.body = params[:topic][:body]
        #@topic.user = current_user
        
        if @topic.save
            flash[:notice] = "Topic was saved."
            redirect_to @topic
        else
            flash[:alert] = "An error saving the topc has occurred. Please try again."
            render :new
        end
    end
    
    def destroy
        @topic = Topic.find(params[:id])
        
      if @topic.destroy
       flash[:notice] = "\"#{@topic.title}\" was deleted successfully."
       redirect_to root_path
      else
       flash.now[:alert] = "There was an error deleting the topic."
       render :show
      end
    end

    
end
