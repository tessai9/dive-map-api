# frozen_string_literal: true

module ResponseConcern
  def success
    ok
    render status: :ok, formats: :json, handlers: :jbuilder, template: 'shared/result'
  end

  def bad_request(exception = nil)
    print_exception_log(exception) if exception

    failed(message: 'Bad Request')
    render status: :bad_request, formats: :json, handlers: :jbuilder, template: 'shared/result'
  end

  def unauthorized(exception = nil)
    print_exception_log(exception) if exception

    failed(message: 'Unauthorized')
    render status: :unauthorized, formats: :json, handlers: :jbuilder, template: 'shared/result'
  end

  def forbidden(exception = nil)
    print_exception_log(exception) if exception

    failed(message: 'Forbidden')
    render status: :forbidden, formats: :json, handlers: :jbuilder, template: 'shared/result'
  end

  def not_found(exception = nil)
    print_exception_log(exception) if exception

    failed(message: 'Not Found')
    render status: :not_found, formats: :json, handlers: :jbuilder, template: 'shared/result'
  end

  def unprocessable_entity(exception = nil)
    print_exception_log(exception) if exception

    failed(message: 'Unprocessable Entity')
    render status: :unprocessable_entity, formats: :json, handlers: :jbuilder, template: 'shared/result'
  end

  def internal_server_error(exception = nil)
    print_exception_log(exception) if exception

    failed(message: 'Internal Server Error')
    render status: :internal_server_error, formats: :json, handlers: :jbuilder, template: 'shared/result'
  end

  def service_unavailable(exception = nil)
    print_exception_log(exception) if exception

    failed(message: 'Service Temporary Unavailable')
    render status: :service_unavailable, formats: :json, handlers: :jbuilder, template: 'shared/result'
  end

  private

  def ok
    @name = 'ok'
  end

  def failed(message:)
    @name = 'falied'
    @message = message
  end

  def print_exception_log(exception)
    logger.error "exception: #{exception.class} => #{exception.message}"
  end
end
