Rails.application.routes.draw do

  	get 'foo/bar'

  	get 'foo/baz'

	root 'static_pages#home'
	get '/help', to: 'static_pages#help'#,as: 'helf'
	get '/about', to: 'static_pages#about'
	get '/contact', to: 'static_pages#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
