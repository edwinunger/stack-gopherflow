Rails.application.routes.draw do

  # get 'questions/edit' This was auto-generated. Not needed

  resources :questions do
    post 'upvote', to: 'questions#upvote'
    post 'downvote', to: 'questions#downvote'
    resources :answers do
      post 'upvote', to: 'answers#upvote'
      post 'downvote', to: 'answers#downvote'
    end
  end
  root 'questions#index'

end
