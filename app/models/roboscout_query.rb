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
# typed: true

class RoboscoutQuery < ApplicationRecord
  extend T::Sig

  has_many :roboscout_query_person
  has_many :people, through: :roboscout_query_person

  sig { returns(Integer) }
  def result_count
    people.count
  end
end
