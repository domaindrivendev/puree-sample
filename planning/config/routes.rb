Planning::Engine.routes.draw do

  resources :submissions, only: [:index, :new, :create]

  resources :conferences do

    resources :submissions, only: [:index], controller: 'conference_submissions' do
      put 'shortlist'
      put 'unshortlist'
    end

    resources :tracks, only: [:index, :new, :create], controller: 'conference_tracks' do
    end
  end
end