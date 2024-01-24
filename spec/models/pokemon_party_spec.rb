require 'rails_helper'

RSpec.describe PokemonParty, type: :model do
  # validating presence of a name
  it 'is not valid without a name' do
    irvin = PokemonParty.create(
      name: nil,
      costume: 'Charmander ski mask',
      contribution: 'sunflower seeds'
    )
    expect(irvin.errors[:name]).to_not be_empty
  end
  # validating presence of a costume
  it 'is not valid without a costume' do
    michael = PokemonParty.create(
      name: 'Squirtle',
      costume: nil,
      contribution: 'adult drinks'
    )
    expect(michael.errors[:costume]).to_not be_empty
  end

  # validating presence of a contribution
  it 'is not valid without a contribution' do
    leo = PokemonParty.create(
      name: 'Pika',
      costume: 'Pikachu',
      contribution: nil
    )
    expect(leo.errors[:contribution]).to_not be_empty
  end

    # validating contribution has more than 7 characters
    it 'is not valid with a contribution that has less than 7 characters' do
      leo = PokemonParty.create(
        name: 'Pika',
        costume: 'Pikachu',
        contribution: 'goods'
      )
      expect(leo.errors[:contribution]).to_not be_empty
    end
end
