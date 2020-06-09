class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :note_text
      t.string :user_id
      t.string :creation_date

      t.timestamps
    end
  end
end
