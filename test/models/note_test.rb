require 'test_helper'

class NoteTest < ActiveSupport::TestCase

  test "should not save note without test" do
    note = Note.new
    note[:user_id] = 1
    assert_not note.save, "Saved Note without text"
  end

  test "should not save note without user" do
    note = Note.new
    note[:note_text] = "note text"
    assert_not note.save, "Saved Note without user"
  end

end
