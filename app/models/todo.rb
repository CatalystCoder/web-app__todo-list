class Todo < ActiveRecord::Base

  def user_access
    x = self.user_id
    y = User.find_by_id(x)
    return y
  end
  
  def creator_name
    x = self.creator_id
    y = User.find_by_id(x)
    return y.name
  end

  def priority_access
    x = self.priority_id
    y= Priority.find_by_id(x)
    return y
  end

end