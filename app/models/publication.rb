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
# typed: true

class Publication < ApplicationRecord
  belongs_to :person
end
