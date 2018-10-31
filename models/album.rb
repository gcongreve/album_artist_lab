require_relative('../db/sql_runner')
require('pg')



class Album

  attr_accessor :title, :artist_id, :genre
  attr_reader :id

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i if options['artist_id']
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO albums
    (title,
      genre,
      artist_id
    )
    VALUES
    ($1, $2, $3)
    RETURNING id"
    values = [@title, @genre, @artist_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    return albums.map { |album| Album.new(album) }
  end


  # def self.find_albums_by_artist(artist)
  #   sql = "SELECT * FROM albums WHERE artist = $1"
  #   values = [artist]
  #   albums = SqlRunner.run(sql, values)
  #   return albums.map { |album| Album.new(album) }
  # end

  def self.find_albums_by_artist_id(artist_id)
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [artist_id]
    albums = SqlRunner.run(sql, values)
    return albums.map { |album| Album.new(album) }
  end

  def update
    sql = "UPDATE albums SET
    title = $1,
    artist = $2,

     WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end



  def delete()
    sql = "DELETE FROM albums WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end


end
