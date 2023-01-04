require_relative "../lib/recipe_repository"

def reset_recipes_table
  seed_sql = File.read('spec/seeds_recipes.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
  connection.exec(seed_sql)
end

describe RecipeRepository do
  before(:each) do 
    reset_recipes_table
  end

  it "returns all recipes" do 
    repo = RecipeRepository.new
    recipes = repo.all
    expect(recipes.length).to eq 2
    expect(recipes[0].id).to eq "1"
    expect(recipes[0].name).to eq "Toad in the Hole"
    expect(recipes[0].cooking_time).to eq "45"
    expect(recipes[0].rating).to eq "4"
    expect(recipes[1].id).to eq "2"
    expect(recipes[1].name).to eq "Sphagetti Bolognese"
    expect(recipes[1].cooking_time).to eq "60"
    expect(recipes[1].rating).to eq "5"
  end

  it "gets a single recipe" do
    repo = RecipeRepository.new
    recipe = repo.find(1)
    expect(recipe.name).to eq ("Toad in the Hole")
    expect(recipe.cooking_time).to eq ("45")
    expect(recipe.rating).to eq ("4")
  end

  it "gets a single recipe" do
    repo = RecipeRepository.new
    recipe = repo.find(2)
    expect(recipe.name).to eq ("Sphagetti Bolognese")
    expect(recipe.cooking_time).to eq ("60")
    expect(recipe.rating).to eq ("5")
  end
end


# # 2
# # Get a single recipe

# repo = AlbumRepository.new

# recipe = repo.find(1)

# recipe.id # =>  1
# recipe.name # =>  'Toad in the Hole'
# recipe.cooking_time # =>  '45'
# recipe.rating # => 4

# # 3
# # Get a single recipe

# repo = AlbumRepository.new

# recipe = repo.find(2)

# recipe.id # =>  1
# recipe.name # =>  'Sphagetti Bolognese'
# recipe.cooking_time # =>  '60'
# recipe.rating # => 5