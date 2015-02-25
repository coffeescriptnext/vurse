module SnippetSortConcern
  extend ActiveSupport::Concern

  VALID_SORT_KEYS = %i(created_at updated_at)
  VALID_SORT_DIRECTIONS = %i(asc desc)
  DEFAULT_SORT_KEY = :created_at
  DEFAULT_SORT_DIRECTION = :desc

  included do
    helper_method :current_sort_key
    helper_method :current_sort_direction
  end

  def current_sort
    # TODO: Validate sort param
    @current_sort ||= params.fetch(:sort, 'created_at:desc').split(':')
  end

  def current_sort_key
    current_sort.first
  end

  def current_sort_direction
    current_sort.second
  end
end
