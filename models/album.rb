class Album
  attr_reader(:name, :quantity, :id, :artist_id)
  def initialize(options)
    @name = options['name']
    @quantity = options['quantity'].to_i
    @id = options['id'].to_i if options['id']
    @artist_id = options['artist_id'].to_i
  end
end
