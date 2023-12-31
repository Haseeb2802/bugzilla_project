Rails.application.routes.draw do
  resources :qa, only: [:index] do
    collection do
      get 'report_bug', to: 'qa#report_bug'
      post 'create_bug', to: 'developer#create_bug'
      get 'show_projects', to: 'qa#show_projects'
    end
  end

  resources :projects do
    member do
      patch 'add_developer'
      get 'add_developer'
      get 'delete', action: :destroy
      post 'add_developer/:user_id', action: :add_developer, as: :add_developer_to
      delete 'remove_qa/:user_id', action: :remove_qa, as: :remove_qa_from
      post 'add_developer'

    end
  end

  resources :projects do
    member do
      patch 'add_developer'
      get 'add_developer'
      patch 'add_qa'
      get 'add_qa'
      get 'delete_developers'
      delete 'delete_developers'
      get 'remove_qa'
    end
  end

  resources :bugs do
    member do
      post 'assign_to_myself'
      post 'pick_up'
      post 'mark_resolved'
    end
  end

  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    unlocks: 'users/unlocks'
  }

  root to: "projects#index"
end