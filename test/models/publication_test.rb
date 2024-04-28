# == Schema Information
#
# Table name: publications
#
#  id           :integer          not null, primary key
#  person_id    :integer
#  abstract     :text
#  title        :text
#  published_at :date
#  openalex_id  :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require "test_helper"

class PublicationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
