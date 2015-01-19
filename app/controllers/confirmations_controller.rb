# Controller for email address confirmations.
class ConfirmationsController < Devise::ConfirmationsController
  layout 'authentication'
end
