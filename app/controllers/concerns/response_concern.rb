module ResponseConcern
  def success
    set_ok
    render status: 200, formats: :json, handlers: :jbuilder, template: 'shared/result'
  end

  def bad_request(exception = nil)
    print_exception_log(exception) if exception

    set_failed(message: 'Bad Request')
    render status: 400, formats: :json, handlers: :jbuilder, template: 'shared/result'
  end

  def unauthorized(exception = nil)
    print_exception_log(exception) if exception

    set_failed(message: 'Unauthorized')
    render status: 401, formats: :json, handlers: :jbuilder, template: 'shared/result'
  end

  def forbidden(exception = nil)
    print_exception_log(exception) if exception

    set_failed(message: 'Forbidden')
    render status: 403, formats: :json, handlers: :jbuilder, template: 'shared/result'
  end

  def not_found(exception = nil)
    print_exception_log(exception) if exception

    set_failed(message: 'Not Found')
    render status: 404, formats: :json, handlers: :jbuilder, template: 'shared/result'
  end

  def internal_server_error(exception = nil)
    print_exception_log(exception) if exception

    set_failed(message: 'Internal Server Error')
    render status: 500, formats: :json, handlers: :jbuilder, template: 'shared/result'
  end

  def service_unavailable(exception = nil)
    print_exception_log(exception) if exception

    set_failed(message: 'Service Temporary Unavailable')
    render status: 503, formats: :json, handlers: :jbuilder, template: 'shared/result'
  end

  private

  def set_ok
    @name = 'ok'
  end

  def set_failed(message:)
    @name = 'falied'
    @message = message
  end

  def print_exception_log(exception)
    logger.error "exception: #{exception.class} => #{exception.message}"
  end
end
