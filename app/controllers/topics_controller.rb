class TopicsController < ApplicationController
    
    def show
        @subject = Subject.find(params[:subject_id])
        @topic = Topic.find(params[:id]) 
    end
    
    def new
        @subject = Subject.find(params[:subject_id])
        @topic = Topic.new
    end
    
    def create
        @subject = Subject.find(params[:subject_id])
        @topic = @subject.topics.build(topic_params)
       
        
        if @topic.save
            flash[:notice] = "Topic was saved."
            redirect_to [@subject, @topic]
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
        @topic.assign_attributes(topic_params)
        
        if @topic.save
            flash[:notice] = "Topic was saved."
            redirect_to [@topic.subject, @topic]
        else
            flash[:alert] = "An error saving the topc has occurred. Please try again."
            render :new
        end
    end
    
    def destroy
        @subject = Subject.find(params[:subject_id])
        @topic = Topic.find(params[:id])
        
      if @topic.destroy
       flash[:notice] = "\"#{@topic.title}\" was deleted successfully."
       redirect_to @subject
      else
       flash.now[:alert] = "There was an error deleting the topic."
       render :show
      end
    end
    
    private
      def topic_params
        params.require(:topic).permit(:title, :body)
      end
   

    
end
