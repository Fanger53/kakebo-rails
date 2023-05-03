# frozen_string_literal: true

class ModalComponent < ViewComponent::Base
  def initialize(title:, body:, id:)
    @title = title
    @body = body
    @id = id
  end
end
