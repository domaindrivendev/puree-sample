Scheduling::Engine.routes.draw do

  resources :conferences do
    put 'call_for_submissions'

    resources :topics, controller: 'conference_topics', only: [:index]
    resources :tracks, controller: 'conference_tracks', shallow: true
  end

  resources :topics do
    put 'shortlist'
    put 'unshortlist'
  end

  resources :tracks do
    resources :sessions, controller: 'track_sessions', shallow: true
  end
end