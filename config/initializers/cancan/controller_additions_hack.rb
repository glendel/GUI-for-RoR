# TODO : Remove this file as soon as the "CanCan" gem solves the bug in the method below related to the "returns" and the "ThreadError - return can't jump across threads" error.
module CanCan
  module ControllerAdditions
    module ClassMethods
      def check_authorization(options = {})
        self.after_filter(options.slice(:only, :except)) do |controller|
          next if controller.instance_variable_defined?(:@_authorized)
          next if options[:if] && !controller.send(options[:if])
          next if options[:unless] && controller.send(options[:unless])
          raise AuthorizationNotPerformed, "This action failed the check_authorization because it does not authorize_resource. Add skip_authorization_check to bypass this check."
        end
      end
    end
  end
end