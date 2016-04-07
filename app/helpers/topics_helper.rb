module TopicsHelper
    def user_is_authorized_for_topics?
        current_user && current_user.moderator? || current_user.admin
    end
end
