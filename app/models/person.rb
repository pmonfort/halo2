# == Schema Information
#
# Table name: people
#
#  id          :integer          not null, primary key
#  openalex_id :string
#  first_name  :string           not null
#  last_name   :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# typed: true

class Person < ApplicationRecord
  extend T::Sig

  has_many :publications

  sig { returns(Integer) }
  def publication_count
    publications.count
  end
end
