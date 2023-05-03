# frozen_string_literal: true

class FormGroupComponent < ViewComponent::Base
  def initialize(model:)
    @model = model
  end
end
