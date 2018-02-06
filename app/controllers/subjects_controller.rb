class SubjectsController < ApplicationController
    
    def index
        @subjects = Subject.all
    end
    
    def show
        @subject = Subject.find(params[:id])
    end
    
    def new
        @subject = Subject.new
    end
    
    def create
        @subject = Subject.new
        @subject.name = params[:subject][:name]
        @subject.user = current_user 
       if @subject.save
         redirect_to @subject, notice: "Subject was saved successfully."
       else
         flash.now[:alert] = "Error creating subject. Please try again."
         render :new
       end
    end
    
    def edit
        @subject = Subject.find(params[:id])
    end
    
    def update
      @subject = Subject.find(params[:id])
      @subject.name = params[:subject][:name]
 
      if @subject.save
        flash[:notice] = "Subject was updated."
        redirect_to @subject
      else
        flash.now[:alert] = "Error saving subject. Please try again."
        render :edit
      end
    end
    
    def destroy
      @subject = Subject.find(params[:id])
 
      if @subject.destroy
        flash[:notice] = "\"#{@subject.name}\" was deleted successfully."
        redirect_to action: :index
      else
        flash.now[:alert] = "There was an error deleting the subject."
        render :show
      end
    end
   
end
