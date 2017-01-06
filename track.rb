class Track

  attr_reader :album_id, :track_id, :title, :track_number, :duration_ms

  def initialize(album_id, track_id, title, track_number, duration_ms)
    @album_id = album_id
    @track_id = track_id
    @title = title
    @track_number = track_number
    @duration_ms = duration_ms
  end

  def get_album_id
    @album_id
  end

  def get_track_id
    @track_id
  end

  def get_title
    @title
  end

  def get_track_number
    @track_number
  end

  def get_duration_ms
    @duration_ms
  end

end
