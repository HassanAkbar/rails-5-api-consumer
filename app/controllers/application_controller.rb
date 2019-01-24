class ApplicationController < ActionController::API
  include ActionController::MimeResponds
    before_action :cors_set_access_control_headers, if: lambda{ request.format.json? }

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = request.env['HTTP_ORIGIN'] if request.env['HTTP_ORIGIN']
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS, PATCH'
    headers['Access-Control-Allow-Headers'] = '*,x-requested-with,Content-Type, X-CSRF-Token, token, api-version, user-token'
    headers['Access-Control-Allow-Credentials'] = "true"
  end
end
