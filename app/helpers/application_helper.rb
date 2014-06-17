module ApplicationHelper

  def current_host
    host = ENV['HOSTNAME']

    if host.nil? || host.blank?
      host = "localhost:3000"
    end

    "#{host}/"
  end

end
