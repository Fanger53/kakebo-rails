# frozen_string_literal: true

class FormTransferComponent < ViewComponent::Base
  def initialize(model:)
    @model = model
  end
end
