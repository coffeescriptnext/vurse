# Controller for CRUDing snippets.
class SnippetsController < ApplicationController
  include SnippetSortConcern

  before_action :authenticate_user!, except: %i(new)

  respond_to :html

  helper ApplicationHelper

  def index
    respond_with snippets
  end

  def new
    if user_signed_in?
      @snippet = Snippet.new
      @snippet.pieces.build
      render :new
    else
      # To avoid flash message
      redirect_to new_user_session_path
    end
  end

  def create
    create_snippet = CreateSnippet.call(user: current_user, params: snippet_params)
    if create_snippet.success?
      redirect_to snippet_path(current_user, create_snippet.snippet)
    else
      @snippet = create_snippet.snippet
      render :new
    end
  end

  def update
    update_snippet = UpdateSnippet.call(snippet: snippet, params: snippet_params)
    if update_snippet.success?
      redirect_to snippet_path(current_user, snippet)
    else
      @snippet = update_snippet.snippet
      render :edit
    end
  end

  def destroy
    snippet.destroy
    redirect_to profile_path(snippet.owner.username)
  end

  private

  def snippets
    @snippets ||= Snippet
                  .order(current_sort_key => current_sort_direction)
                  .includes(:pieces)
                  .page(params[:page])
                  .per(10)
  end
  helper_method :snippets

  def snippet
    @snippet ||= Snippet.includes(:pieces).find(params[:id])
  end
  helper_method :snippet

  def snippet_params
    params.require(:snippet).permit(:name, :description, pieces_attributes: %i(id name language body _destroy))
  end
end
