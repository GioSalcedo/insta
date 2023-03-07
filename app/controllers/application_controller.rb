class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
      
    protected
      
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :bio, :avatar, :location])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :bio, :avatar, :location])
    end
    
    def cable_ready_channel
      @cable_ready_channel ||= begin
        cable = ActionCable.server
        channel = cable.channels["CommentChannel"] # Reemplaza "MyChannelName" por el nombre de tu canal
        CableReady::Channels.new(channel)
      end
    end
end
