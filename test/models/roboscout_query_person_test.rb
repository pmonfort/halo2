# == Schema Information
#
# Table name: roboscout_query_people
#
#  id                 :integer          not null, primary key
#  roboscout_query_id :integer          not null
#  person_id          :integer          not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
require "test_helper"

class RoboscoutQueryPersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
