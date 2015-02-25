class CreateSnippet
  include Interactor

  def call
    snippet = context.snippet = user.snippets.create(params)
    return if snippet.persisted?

    snippet.pieces.build if snippet.pieces.size < 1
    context.fail!
  end

  private

  def params
    context.params.dup
  end

  def user
    context.user
  end
end
