# typed: true

class RoboscoutQueryPerson < ApplicationRecord
  belongs_to :person
  belongs_to :roboscout_query
end
