module RegistrationsHelper
    def is_auth?
        current_user.provider != "" || current_user.provider != nil
    end
end