class UpdateSnippet
  include Interactor

  def call
    return if snippet.update(params)

    snippet.pieces.build if snippet.pieces.count < 1
    context.fail!
  end

  private

  def params
    context.params.dup
  end

  def snippet
    context.snippet
  end
end
