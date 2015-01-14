# Abstract base class for API controllers.
class APIController < ApplicationController
  self.responder = APIResponder
  respond_to :json
end
