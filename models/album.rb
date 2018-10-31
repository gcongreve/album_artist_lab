require_relative('../db/sql_runner')
require('pg')



class Album

  attr_accessor :title, :artist_id, :genre, :artist
  attr_reader :id

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @artist = options['artist']
    @artist_id = options['artist_id'].to_i if options['artist_id']
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO albums
    (title,
      artist,
      genre,
      artist_id
    )
    VALUES
    ($1, $2, $3, $4)
    RETURNING id"
    values = [@title, @artist, @genre, @artist_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    return albums.map { |album| Album.new(album) }
  end


  def self.find_by_artist(artist)
    sql = "SELECT * FROM albums WHERE artist = $1"
    values = [artist]
    albums = SqlRunner.run(sql, values)
    return albums.map { |album| Album.new(album) }
  end


end
