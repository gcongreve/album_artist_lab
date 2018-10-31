require_relative('../db/sql_runner')
require('pg')


class Artist

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id"
    values= [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    return artists.map { |artist| Artist.new(artist) }
  end


  def artists_albums() #use on artist to find their albums
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id] #use artists id to find their abums
    albums = SqlRunner.run(sql, values)
    return albums.map {|albums| Albums.new(albums)}
  end

  def self.find_artist_by_album(album)
    sql = "SELECT * FROM albums WHERE title = $1"
    values = [album]
    albums = SqlRunner.run(sql, values)
    return albums.first['artist']
  end

  def update
    sql = "UPDATE artists SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end


end
