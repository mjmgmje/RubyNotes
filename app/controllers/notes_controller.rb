class NotesController < ApplicationController


  def index
    @notes = Note.where("user_id = #{session[:user_id]}") 
  end

  def new
    @note = Note.new
  end

  def create
    requestNote = {}
    requestNote[:note_text] = params[:note_text]
    requestNote[:user_id]=session[:user_id]
    @note = Note.create(requestNote)

    respond_to do |format|
      format.html { redirect_to index, notice: 'Note was created succesfully'}
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  def destroy
    @note = Note.find(params[:id])  
    @note.destroy

    respond_to do |format|
      format.html { redirect_to index, notice: 'Note was deleted succesfully'}
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  def noteChange
    @note = Note.find(params[:id])  
    
    respond_to do |format|
      format.html { redirect_to index, notice: 'Note ready to change'}
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  def update
    @noteOld = Note.find(params[:id])
    noteNew = {}
    noteNew[:note_text] = params[:note_text]
    @noteOld.update(noteNew)      
    respond_to do |format|
      format.html { redirect_to index, notice: 'Note ready to change'}
      format.json { head :no_content }
      format.js   { render :layout => false}
    end
  end

end
