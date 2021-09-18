class Result < ApplicationRecord
  OK = 'ok'
  FAILED = 'failed'

  def initialize(result:, error_data:)
    @result = result
    @error_data = error_data
  end
end
