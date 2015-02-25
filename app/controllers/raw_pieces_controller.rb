# Controller for raw snippet pieces.
class RawPiecesController < ApplicationController
  def index
    render plain: snippet.pieces.first.body
  end

  def show
    render plain: piece.body
  end

  private

  def user
    @user ||=
      if current_user.username == params[:username]
        current_user
      else
        User.find_by!(username: params[:username])
      end
  end

  def snippet
    @snippet ||= user.snippets.find(params[:snippet_id])
  end

  def piece
    @piece ||= Piece.find(params[:piece_id])
  end
end
