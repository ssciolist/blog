class ApplicationController < ActionController::Base
    helper_method :registered_user, :not_found_404

    def registered_user
        @registered_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def not_found_404
        render file: "#{Rails.root}/public/404.html"
    end

    def require_registered_user
        not_found_404 unless registered_user
    end

end
