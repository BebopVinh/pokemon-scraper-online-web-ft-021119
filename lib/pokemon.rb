class Pokemon
  attr_accessor :id, :name, :type, :hp, :db
  @@all = []

def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @hp = hp
    @type = type
    @db = db
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type);
  end

  def self.find(id_num, db)
    new_pokemon = db.execute("SELECT * FROM pokemon WHERE pokemon.id = (?)", id_num).flatten;
    Pokemon.new(id:info[0], name:info[1], type:info[2], db:db)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = (?) WHERE id = (?)", new_hp, self.id);
  end
end
