## Active Record Validations and Specs 1/24/24 India

## Create empty github repo
- Click the github classroom link
- One team member sets up the team name on github classroom and accepts the github classroom assignment  
- One team member creates a rails app and follow the instructions in the syllabus to link the github and local repo and make initial commit
  
## Create Rails app on Desktop
- $ cd Desktop
- $ rails new rails-validations -d postgresql -T
- $ cd rails-validations
- $ rails db:create
- $ code .
- $ bundle add rspec-rails
- $ rails generate rspec:install

## Initial commit
- copy and paste the `git remote add` terminal command from the empty github repo
- create a main branch:  $ git checkout -b main
- Initial commit message: "initial commit"
- Push changes to the main branch
- All team members will clone the github repo

## Switching drivers
- Ensure the github repo is cloned
- Run bundle to get all required dependency: $ bundle

## Generate Model
- $ rails g model PokemonParty name:string costume:string contribution:string  
***NOTE: Because rspec has been installed, rails will generate not only a model and migration file but also a testing file for the model.***
- $ rails db:migrate  
***NOTE: This command saves the current status of the database in a schema file.***

## To view the application in the browser
- Begin the rails server: $ rails server
- In a browser navigate to: http://localhost:3000
- To stop the server: `control + C`

## Vocab
- validations: verifies that the data entries are meeting the specifications set in the database
- specs: specifications, rules for each database column
- test-driven development (TDD): instills confidence that the expected outcome is delivered to the user
    - Write failing tests
    - Making them pass
    - Refactor and verify that everything still pass

## Specs
- Testing the model aka validations
- Located in spec/models/pokemon_party_spec.rb
- Validate that each entry has a name, costume, and contribution
- Validate that the costume has at least 7 characters

```rb
# imports
require 'rails_helper'

# spec test structure - describe, it, expect, rspec matcher

# describe: encapsulates the test for the model, takes the model and a ruby block as arguments
RSpec.describe PokemonParty, type: :model do
  # validating presence of a name
  # it: nested within the describe block, takes a string that describes the validation that is being tested and a ruby block as an argument
  it 'is not valid without a name' do
    # make an object using the create method and ensure that the entry is missing what is being validated
    irvin = PokemonParty.create(
      name: nil,
      costume: 'Charmander ski mask',
      contribution: 'sunflower seeds'
    )
    # expect: nested within the it block, takes the expected error log as an argument with the rpsec matcher appended to the end 
    expect(irvin.errors[:name]).to_not be_empty
  end
end

```
- To execute the spec test: $ rspec spec/models/pokemon_party_spec.rb

- Verify that it is good failure  
`expected `[].empty?` to be falsey, got true` means that the error logs is empty.  
```bash
1 example, 1 failure
```
- Make the spec pass
- Place the validation on the applicable model (app/models/pokemon_party.rb)
```rb
class PokemonParty < ApplicationRecord
  # validation with the column name as a symbol and the validation helper presence
  validates :name, presence: true
end
```

- To execute the spec test: $ rspec spec/models/pokemon_party_spec.rb

- Verify that it passed
```bash
PokemonParty
  is not valid without a name

Finished in 0.02227 seconds (files took 0.73976 seconds to load)
1 example, 0 failures
```

- Refactor the specifications. Because name and costume are using the same validation helper, we will place the specifications on one line.

### Redundant code
validates :name, presence: true  
validates :costume, presence: true

### Refactor
validates :name, :costume, presence: true
