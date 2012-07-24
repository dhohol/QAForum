QAForum::Application.routes.draw do
  root :to => 'questions#index'

  resources :questions do
    resources :answers
  end
end
