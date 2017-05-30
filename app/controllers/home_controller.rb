class HomeController < ApplicationController

   before_action :authenticate_user!



   skip_before_filter  :verify_authenticity_token

   def result
    #  puts "fuck ingredients"
    #  puts params[:search]
     response = Unirest.get "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/findByIngredients?fillIngredients=false&ingredients=#{params[:search]}&limitLicense=false&number=24&ranking=1",
       headers:{
         "X-Mashape-Key" => ENV["MASHAPE_API_KEY"],
         "Accept" => "application/json"
       }

      @response = response.body

      # render json: response.body

   end

  def index
    response = Unirest.get "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/food/trivia/random",
  headers:{
    "X-Mashape-Key" => ENV["MASHAPE_API_KEY"],
    "Accept" => "application/json"
  }
    @response = response.body

    # render json: response.body
    @body_class = "home_body"

  end

  def about
    @body_class = "about_body"
  end

  def contact
    @body_class = "contact_body"
  end

  def email

        # set the from, subject and to addresses
        from = SendGrid::Email.new(email: params[:from])
        subject = params[:subject]
        to = SendGrid::Email.new(email: "martoranov94@gmail.com")


          # set the content to send in the email
          content = SendGrid::Content.new(type: 'text/plain', value: params[:content])

          # set the mail attribute values
          mail = SendGrid::Mail.new(from, subject, to, content)

          # pass in the sendgrid api key
          sg = SendGrid::API.new(api_key: ENV["SENDGRID_API_KEY"])

          # send the email
          response = sg.client.mail._('send').post(request_body: mail.to_json)

          # display the response status code and body
          puts "Status code = #{response.status_code}"
          puts response.body

          redirect_to contact_path
  end
end
