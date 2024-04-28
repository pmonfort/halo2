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
# typed: true

class RoboscoutQueryPerson < ApplicationRecord
  belongs_to :person
  belongs_to :roboscout_query
end
