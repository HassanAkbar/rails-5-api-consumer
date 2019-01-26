ActiveSupport.on_load(:action_controller) do
  require 'active_model_serializers'        
end
ActiveModelSerializers.config.adapter = :json_api