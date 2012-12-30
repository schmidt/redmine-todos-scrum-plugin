RedmineApp::Application.routes.draw do
	resources :users do
		resources :todos, :controller => 'mytodos' do
			member do
				post :toggle_complete
			end

			collection do
				post :sort
			end
		end
	end

	resources :projects do
		resources :todos do
			post :toggle_complete, :on => :member
			post :sort, :on => :collection
		end
	end

	#scope 'my' do
	#	resources :todos, :controller => 'mytodos' do
	#		member do
	#			post :toggle_complete
	#		end
	#	end
	#end

	match 'my/todos' => 'mytodos#index', :as => :my_todos
end
