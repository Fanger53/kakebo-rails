# frozen_string_literal: true

class FormComponent < ViewComponent::Base
  def initialize(model:)
    @model = model
  end
end
