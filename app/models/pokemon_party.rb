class PokemonParty < ApplicationRecord
  validates :name, :costume, :contribution, presence: true
  validates :contribution, length: { minimum: 7 }
end
