# typed: true

class RoboscoutQuery < ApplicationRecord
  extend T::Sig

  has_many :roboscout_query_results

  sig { returns(Integer) }
  def result_count
    roboscout_query_results.count
  end
end
