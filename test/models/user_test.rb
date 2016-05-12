# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  reward                 :integer          default(0)
#  isadmin                :boolean          default(FALSE)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @new_user = User.new(email: "abc@domain.net", password: "12345677")
  end
 
  module InstanceMethodTest
   
    def test_user_creation
      assert_difference 'User.count', 1 do
        @new_user.save
      end
      
      assert_equal(0, users(:test_user).reward)
    end
  
    def test_user_update_reward
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
 
  include ClassMethodTest
  include InstanceMethodTest 
end
