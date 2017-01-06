require_relative 'track'

class Album

  attr_reader :id, :title, :artists, :tracks

  def initialize(id, title, artists)
    @id, @title, @artists = id, title, artists
    @tracks = []
  end

  def summary
    string = ""
    string << "\nName: #{@title}"
    string << "\nArtist(s): #{@artists}"
    string << "\nDuration (min.): #{duration_min}"
    string << "\nTracks:"
    track_names = get_tracks
    track_names.each {|value| string << "\n- #{value}"}
    string
  end

  def duration_min
    duration = 0.0
    @tracks.each {|track| duration += track.get_duration_ms.to_f}
    duration = '%.2f' % (duration / 60000)
    duration
  end

  def get_tracks
    track_names = []
    @tracks.each {|track| track_names << track.get_title}
    track_names
  end

  def get_id
    @id
  end

  def get_title
    @title
  end

  def get_artists
    @artists
  end

end
