Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users
  
    root to: 'subjects#index'
    
    get 'index', to: 'subjects#index'
    
    get 'new_subject', to: 'subjects#new_subject'
    get 'create_new_subject', to: 'subjects#create_new_subject'
    
    get 'new_task', to: 'subjects#new_task'
    get 'create_new_task', to: 'subjects#create_new_task'
    
    get 'prep_del_sub', to: 'subjects#prep_del_sub'
    get 'del_subject', to: 'subjects#del_subject'
    
    get 'prep_del_task', to: 'subjects#prep_del_task'
    get 'del_task', to: 'subjects#del_task'
    
    get 'users', to: 'subjects#users'
    
    get 'statistic', to: 'subjects#statistic'
    
    resources :subjects do
      resources :tasks
    end  
  end
  
end



