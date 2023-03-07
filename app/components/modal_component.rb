# frozen_string_literal: true

class ModalComponent < ViewComponent::Base
  def initialize(title:, body:)
    @title = title
    @body = body
  end
end
