module TopicsHelper
    def user_is_authorized_for_topics?
        current_user && current_user.moderator?
    end
end
