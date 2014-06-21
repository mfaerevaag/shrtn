module ApplicationHelper

  def current_host
    host = request.host

    "#{host}/"
  end

end
