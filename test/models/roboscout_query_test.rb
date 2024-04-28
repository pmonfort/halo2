# == Schema Information
#
# Table name: roboscout_queries
#
#  id         :integer          not null, primary key
#  query      :text
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class RoboscoutQueryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
