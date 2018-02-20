class UsersController < ApplicationController
  def show
    @subject = Subject.new
    @subjects = current_user.subjects
   
    @notes = current_user.notes
  end
  
  def review
    @notes = current_user.notes
    
  end
  
  def reviewed
    @notes = current_user.notes
    
    @notes.each do |note|
      if note.review == true
         note.review
      end
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Account deleted"
    redirect_to new_user_session_url
  end

end
