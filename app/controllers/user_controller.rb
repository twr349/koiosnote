class UserController < ApplicationController
  def show
    @subject = Subject.new
    @subjects = current_user.subjects
  end
end
