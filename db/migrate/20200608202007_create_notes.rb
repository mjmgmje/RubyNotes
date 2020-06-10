class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :note_text, null: false
      t.string :user_id, null:false

      t.timestamps
    end
  end
end
