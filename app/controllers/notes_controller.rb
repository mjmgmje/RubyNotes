class NotesController < ApplicationController
  def index
    @notes = Note.where("user_id = #{session[:user_id]}")    
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def create
    requestNote = params.require(:note).permit(:note_text)
    requestNote[:user_id]=session[:user_id]
    @note = Note.create(requestNote)
    @note[:user_id] = session[:user_id]
    redirect_to '/welcome'
  end
end
