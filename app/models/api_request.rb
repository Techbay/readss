# == Schema Information
#
# Table name: api_requests
#
#  id         :integer          not null, primary key
#  address    :string
#  from       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  trans_id   :string
#

class ApiRequest < ApplicationRecord
  default_scope { order(id: :desc) }
end
