Rails.application.routes.draw do
  get 'places', action: :index, controller: 'places'
  get 'places/venues', action: :venues, controller: 'places'
  get 'places/pubs', action: :pubs, controller: 'places'
  post 'places', action: :create, controller: 'places'
  put 'places', action: :update, controller: 'places'
  delete 'places', action: :destroy, controller: 'places'

  get 'routes', action: :index, controller: 'routes'
  get 'routes/best', action: :best, controller: 'routes'
  post 'routes', action: :create, controller: 'routes'
  put 'routes', action: :update, controller: 'routes'
  delete 'routes', action: :destroy, controller: 'routes'

  get 'login', action: :index, controller: 'login'
  post 'login', action: :login, controller: 'login'

  get 'enter', action: :index, controller: 'enter'
  post 'enter', action: :enter, controller: 'enter'
end
