class Pokemon
   
    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end
    def self.save(name, type, db)
        sql = <<-SQL
        INSERT INTO pokemon (name, type)
        VALUES (?, ?)
        SQL
        db.execute(sql, name , type)
    end

    def self.find(id, db)
        sql = <<-SQL
        SELECT *
        FROM pokemon
        WHERE id = ?
        LIMIT 1
        SQL
        poke = db.execute(sql, id)[0]
        Pokemon.new(id: poke[0], name: poke[1], type: poke[2], db: db)
    end

    # def self.find(id, db)
    #     pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
    #     Pokemon.new(id: poke[0], name: poke[1], type: poke[2], db: db)
   
    # end
end
