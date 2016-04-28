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

class List < ApplicationRecord
end
