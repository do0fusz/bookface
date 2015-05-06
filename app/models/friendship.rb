class Friendship < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :friend, class_name: "User"

  def cancel_friendship
    self.friendships.destroy
  end

  def delete_friendship
    self.destroy 
  end

  def accept_friendship
    self.update_attributes(state: "accepted", friended_at: Time.now)
  end

end
