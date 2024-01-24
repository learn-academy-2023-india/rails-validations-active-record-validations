class CreatePokemonParties < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemon_parties do |t|
      t.string :name
      t.string :costume
      t.string :contribution

      t.timestamps
    end
  end
end
