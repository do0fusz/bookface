module UsersHelper
  
  def action_buttons(user)
    case current_user.friendship_status(user) 
      when "friends"
        link_to "Cancel Frienship", friendship_path(current_user.friendship_relation(user)), method: :delete
      when "pending"
        link_to "Cancel Frienship", friendship_path(current_user.friendship_relation(user)), method: :delete
      when "requested"
        # "Accept or Deny"
        # need to links 
        link_to "Accept friendship", accept_friendship_path(current_user.friendship_relation(user) ), method: :put
      when "not_friends"
        link_to "Add as Friends", friendships_path(user_id: user.id), method: :post
    end
  end

end
