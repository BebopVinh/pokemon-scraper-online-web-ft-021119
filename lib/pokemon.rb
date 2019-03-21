class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  @@all = []
  def initialize(id: nil, name: nil, type: nil, db: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES ('#{name}', '#{type}')")
  end

  def self.find(id, db)
    info = db.execute("SELECT * FROM pokemon WHERE id = #{1}").flatten
    if pokemon = @@all.find {|pokemon| pokemon.id == id}
      pokemon
    else
      Pokemon.new(id:info[0], name:info[1], type:info[2], db:db)
    end
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = (?) where id = (?)", new_hp, @id)
    self.hp = new_hp
  end

end
