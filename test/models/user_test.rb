require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "user_creation" do
    new_user = User.new()
    assert(new_user.reward == 0, failure_message="default reward is not zero")
  end
  
  test "user_update_reward" do
    new_user = User.new()
    
    #add points
    change = 10
    result = new_user.reward + 10
    new_user.add_reward(change)
    assert(new_user.reward == result, failure_message = "reward addition not correct")
    
    #subtract points
    change = 5
    result = new_user.reward - 5
    new_user.subtract_reward(change)
    assert(new_user.reward == result, failure_message = "reward subtraction not correct")
    
    #reward points cannot be negative
    change = new_user.reward + 3
    new_user.subtract_reward(change)
    assert(new_user.reward >= 0 , failure_message = "reward cannot be negative")
  end
  
  
end
