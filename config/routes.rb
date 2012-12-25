Irclog::Application.routes.draw do
  
  scope ":year-:month", :as => "logs" do
    get "/" => "logs#index"
    
    scope ":day", :as => "show" do
      get "/" => "logs#show"
    end
  end

  root to: 'logs#hello'
end
