module UsersHelper
  
  def action_buttons(user)
    case current_user.friendship_status(user) 
      when "friends"
        "cancel friendship"
      when "pending"
        "cancel request"
      when "requested"
        "Accept or Deny"
      when "not_friends"
        "Add as friend"
    end
  end

end
