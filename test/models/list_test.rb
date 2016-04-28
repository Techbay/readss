# == Schema Information
#
# Table name: lists
#
#  id         :integer          not null, primary key
#  name       :string
#  rid        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ListTest < ActiveSupport::TestCase

  setup do
  end

  module ClassMethodTest
  end

  module InstanceMethodTest
  end

  module ValidatesTest
    def valid_attributes
      {rid: "1234567", name: "valid names"}
    end

    def invalid_attributes
      {rid: nil, name: "valid names"}
    end

    def test_valid_attributes
      assert List.new(valid_attributes).save, "should success with valid attributes"
    end

    def test_invalid_attributes
      assert_not List.new(invalid_attributes).save, "should not success with invalid attributes"

    end

    def test_uniqueness
      List.create(valid_attributes)
      assert_not List.new(valid_attributes).save, "should not success while rid are the same"
    end
  end

  include ClassMethodTest
  include InstanceMethodTest
  include ValidatesTest

end
