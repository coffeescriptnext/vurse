Rails.application.routes.tap do |routes|
  app_config = Rails.configuration.vurse

  routes.default_url_options = {
    host:     app_config[:tld_host],
    protocol: app_config[:tld_protocol]
  }

  routes.draw do
    namespace :api do
      root to: 'root#index'
    end

    devise_for :users, skip: %i(confirmations invitations passwords registrations sessions unlocks)

    scope format: false do
      devise_scope :user do
        get '/accept-invitation' => 'invitations#edit', as: :accept_user_invitation
        get '/remove-invitation' => 'invitations#destroy', as: :remove_user_invitation
        post '/invitations' => 'invitations#create', as: :user_invitation
        get '/invitations/new' => 'invitations#new', as: :new_user_invitation
        patch '/invitations' => 'invitations#update', as: :update_user_invitation

        get '/login' => 'sessions#new', as: :new_user_session
        post '/login' => 'sessions#create', as: :user_session
        get '/logout' => 'sessions#destroy', as: :destroy_user_session

        get '/forgot-password' => 'passwords#new', as: :new_user_password
        post '/forgot-password' => 'passwords#create', as: :user_password
        get '/reset-password' => 'passwords#edit', as: :edit_user_password
        patch '/reset-password' => 'passwords#update', as: :update_user_password

        get '/unlock-account/resend' => 'unlocks#new', as: :new_user_unlock
        post '/unlock-account/resend' => 'unlocks#create', as: :user_unlock
        get '/unlock-account' => 'unlocks#show', as: :show_user_unlock

        get '/confirm-email/resend' => 'confirmations#new', as: :new_user_confirmation
        post '/confirm-email/resend' => 'confirmations#create', as: :user_confirmation
        get '/confirm-email' => 'confirmations#show', as: :show_user_confirmation

        if app_config[:registration_enabled].to_bool
          post '/register' => 'registrations#create', as: :user_registration
          get '/register' => 'registrations#new', as: :new_user_registration
        end

        get '/account' => 'registrations#edit', as: :edit_user_registration
        patch '/account' => 'registrations#update', as: :update_user_registration
        delete '/account' => 'registrations#destroy', as: :delete_user_registration
      end
    end

    get '/recent' => 'snippets#index', format: false

    root to: 'snippets#new', format: false

    resources :snippets, path: '/:username', only: %i(create show edit update destroy) do
      get '/raw' => 'raw_pieces#index', as: :raw
      get '/raw/:piece_id(/:name)' => 'raw_pieces#show', as: :raw_piece
    end

    get '/:username' => 'profiles#show', format: false, as: :profile
  end
end
