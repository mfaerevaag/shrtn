module ApplicationHelper

  def current_host
    ENV[:HOST] || "frv.ag/"
  end

end
