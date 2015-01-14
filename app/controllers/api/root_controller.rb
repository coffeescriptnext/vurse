# Namespace for API components.
module API
  # Controller for the root API resource.
  class RootController < APIController
    # Responds with the root API resource.
    def index
      resource = {}
      respond_with resource
    end
  end
end
