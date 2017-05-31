class RecipesController < ApplicationController
  def index

  end

  def try
    response = Unirest.get "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/random?number=12",
    headers:{
      "X-Mashape-Key" => ENV["MASHAPE_API_KEY"],
      "Accept" => "application/json"
    }
    @response = response.body

  end

  # def favorites
  #   @response = Unirest.get "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/#{params[:id]}/information?includeNutrition=false",
  #   headers:{
  #     "X-Mashape-Key" => ENV["MASHAPE_API_KEY"],
  #     "Accept" => "application/json"
  #   }
  #
  # end

  # def saver
  #
  #   @response = Unirest.get "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/#{params[:id]}/information?includeNutrition=false",
  #   headers:{
  #     "X-Mashape-Key" => ENV["MASHAPE_API_KEY"],
  #     "Accept" => "application/json"
  #   }
  #
  #   @response = response.body
  #
  #   @favorite = Favorite.new(title: @response.body["title"],  image: @response.body["image"])
  #
  #   @user = User.find(params[:user_id])
  #   new_favorite = @favorite
  #   @user.favorite = new_favorite.to_i
  #
  #   @user.save #store to database!
  # end


  def show

    @response = Unirest.get "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/#{params[:id]}/information?includeNutrition=false",
    headers:{
      "X-Mashape-Key" => ENV["MASHAPE_API_KEY"],
      "Accept" => "application/json"
    }

    @ingredients = @response.body["extendedIngredients"]

    @instructions = @response.body["analyzedInstructions"][0]["steps"]

    @body_class = "show_body"


    # }
    # @response = response.body
  end

end
