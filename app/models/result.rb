# frozen_string_literal: true

class Result < ApplicationRecord
  OK = 'ok'
  FAILED = 'failed'

  def initialize(result:, error_data:)
    super
    @result = result
    @error_data = error_data
  end
end
