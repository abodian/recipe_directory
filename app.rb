require_relative 'lib/database_connection'
require_relative 'lib/recipe_repository'
# We need to give the database name to the method `connect`.
DatabaseConnection.connect('recipes_directory')

recipe_repository = RecipeRepository.new

recipe_repository.all.each do |recipe|
  p "#{recipe.id} - #{recipe.name} - Cooking Time: #{recipe.cooking_time} mins - Rating: #{recipe.rating} out of 5"
end