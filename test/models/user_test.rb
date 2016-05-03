require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
 
  module InstanceMethodTest
   
    def user_creation
      #assert(users(:test_user).reward == 0, failure_message="default reward is not zero")
      assert_equal(0, users(:test_user).reward)
    end
  
    def user_update_reward
      #add points
      change = 10
      result = users(:test_user).reward + 10
      users(:test_user).add_reward(change)
      assert_equal(result, users(:test_user).reward)
      
      #subtract points
      change = 5
      result = users(:test_user).reward - 5
      users(:test_user).subtract_reward(change)
      assert(result, users(:test_user).reward)
      
      #reward points cannot be negative
      change = users(:test_user).reward + 3
      users(:test_user).subtract_reward(change)
      assert(users(:test_user).reward >= 0 , "reward cannot be negative")
    end
  end
  
  module ClassMethodTest
  end
  
  
end
