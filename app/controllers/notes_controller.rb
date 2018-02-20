class NotesController < ApplicationController
    
    def index
     @note = Note.find_by_id
    end
    
    def show
        @notes = Note.all
        @topic = Topic.find(params[:topic_id])
        @note = Note.find(params[:id]) 
    end
    
    def new
        @topic = Topic.find(params[:topic_id])
        @note = Note.new
    end
    
    def create
        @topic = Topic.find(params[:topic_id])
        @note = @topic.notes.build(note_params)
        @note.user = current_user
       
        if @note.save
            flash[:notice] = "Note was saved."
            redirect_to [@topic, @note]
        else
            flash[:alert] = "An error saving the note has occurred. Please try again."
            render :new
        end
    end
    
    def edit
        @note = Note.find(params[:id])
    end
    
    def update
        @note = Note.find(params[:id])
        @note.assign_attributes(note_params)
        
        if @note.save
            flash[:notice] = "Note was updated."
            redirect_to [@note.topic, @note]
        else
            flash[:alert] = "An error updating the note has occurred. Please try again."
            render :new
        end
    end
    
    def destroy
        @topic = Topic.find(params[:topic_id])
        @note = Note.find(params[:id])
        
        if @note.destroy
          flash[:notice] = "\"#{@note.title}\" was deleted successfully."
          redirect_to @topic
        else
          flash.now[:alert] = "There was an error deleting the note."
          render :show
        end
    end
    
    private
      def note_params
        params.require(:note).permit(:title, :body, :review)
      end
end
