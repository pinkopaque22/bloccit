module TopicsHelper
<<<<<<< Updated upstream
    def user_is_authorized_for_topics?
        current_user && current_user.moderator? || current_user.admin
=======
    def user_can_edit_topics?
        current_user && current_user.admin? || current_user.moderator?
    end
    def user_can_create_or_delete_topics?
        current_user && current_user.admin?
>>>>>>> Stashed changes
    end
end
