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
    result = albums.map { |albums| Album.new( albums ) }
    return result
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

  def self.find_artist_by_id(id)
    sql =  "SELECT FROM artists WHERE id = $1"
    values = [id]
    artist = SqlRunner.run(sql, values)
    return artist.first
  end


  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end


end
