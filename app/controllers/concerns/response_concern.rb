module ResponseConcern
  def success
    set_ok
    render status: 200, formats: :json, handlers: :jbuilder, template: 'shared/result'
  end

  def not_found
    set_failed(message: 'Not Found')
    render status: 404, formats: :json, handlers: :jbuilder, template: 'shared/result'
  end

  def internal_server_error
    set_failed(message: 'Internal Server Error')
    render status: 500, formats: :json, handlers: :jbuilder, template: 'shared/result'
  end

  def service_unavailable
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
end
