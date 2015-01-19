class SnippetsController < ApplicationController
  before_action :authenticate_user!, except: %i(new)

  def new
    if user_signed_in?
      render 'snippets/new'
    else
      # To avoid flash message
      redirect_to new_user_session_path
    end
  end
end
