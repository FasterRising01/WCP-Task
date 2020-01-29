class ApplicationController < ActionController::Base

	def after_sign_in_path_for(resource)
    	user_path(current_user) # ログイン後に遷移するpathを設定
	end

	def after_sign_out_path_for(resource)
    	flash[:notice] = "Signed out successfully."
    	root_path  # ログアウト後に遷移するpathを設定
	end

	def set_current_user
 	 @current_user = User.find_by(id: session[:user_id])
	end

	before_action :configure_permitted_parameters, if: :devise_controller?


protected
	def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name])
    end

end
