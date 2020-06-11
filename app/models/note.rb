class Note < ApplicationRecord
    validates :note_text, presence:true
end
