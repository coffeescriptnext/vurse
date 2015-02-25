class ProfilesController < ApplicationController
  include SnippetSortConcern

  before_action :authenticate_user!

  helper ApplicationHelper

  private

  def user
    @user ||= User.find_by!(username: params[:username])
  end
  helper_method :user

  def snippets
    @snippets ||= user.snippets
                  .order(current_sort_key => current_sort_direction)
                  .includes(:pieces)
                  .page(params[:page])
                  .per(10)
  end
  helper_method :snippets
end
