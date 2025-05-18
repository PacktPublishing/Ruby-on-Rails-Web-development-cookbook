module Admin
  class ApplicationController < ::ApplicationController
    layout 'admin'

    # Ensure only admins can access the admin namespace
    before_action :require_admin

    private

    def require_admin
      unless Current.user&.admin?
        redirect_to projects_url(subdomain: "app"), alert: "You are not authorized to access this section."
      end
    end
  end
end