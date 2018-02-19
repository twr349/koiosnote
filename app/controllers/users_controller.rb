class UsersController < ApplicationController
  def show
    @subject = Subject.new
    @subjects = current_user.subjects
    @notes = current_user.notes
  end
end
