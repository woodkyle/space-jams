require 'csv'
require_relative 'album'
require_relative 'track'

albums = []

CSV.foreach('space_jams.csv', headers: true, header_converters: :symbol) do |row|

  #Create a hash for the whole row, and a new instance of Track.
  track_hash = row.to_hash
  track = Track.new(track_hash[:album_id], track_hash[:track_id],
    track_hash[:title], track_hash[:track_number], track_hash[:duration_ms])

  #Find an album by matching the album.id with track_hash[:album_id].
  album = albums.find { |a| a.id == track_hash[:album_id] }

  #If the album hasn't been added to the albums array yet, add it.
  if album.nil?
    album = Album.new(track_hash[:album_id], track_hash[:album_name], track_hash[:artists])
    albums << album
  end

  #Add the track to the album's @tracks instance variable.
  album.tracks << track

end

#Print out the summary for each album.
albums.each {|album| puts album.summary}
