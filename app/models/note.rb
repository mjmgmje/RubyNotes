class Note < ApplicationRecord
    validates :note_text, presence:true
    validates :user_id, presence:true
end
