class UsersController < ApplicationController
  def show
    @subject = Subject.new
    @subjects = current_user.subjects
    @notes = current_user.notes
  end
  
  def review
    @notes = Note.where(review: true)
  end
  
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Account deleted"
    redirect_to new_user_session_url
  end

end
