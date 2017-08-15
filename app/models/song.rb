class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  # def song_genre_id
  #   @song_genre_id
  # end
  #
  # def song_genre_id=(id)
  #    self.genre = Genre.find_by(id: id)
  #  end

  def genre_name
      self.try(:genre).try(:name)
  end

   def genre_name=(name)
     self.genre = Genre.find_or_create_by(name: name)
   end

   def artist_name
     self.try(:artist).try(:name)
   end

   def artist_name=(name)
     self.artist = Artist.find_or_create_by(name: name)
   end

   def note_contents
     self.notes.map do |note|
       note.content
     end
   end

   def note_contents=(contents)
     contents.each do |content|
       if content != ""
         new_note = Note.new(content: content)
         self.notes << new_note
       end
     end
   end
end
