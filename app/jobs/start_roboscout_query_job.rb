# typed: true

class StartRoboscoutQueryJob < ApplicationJob
  extend T::Sig
  include Sidekiq::Job

  sig { params(query_id: Integer).void }
  def perform(query_id)
    query = RoboscoutQuery.find_by(id: query_id)

    # TODO: Start the search.
    # See app/services/open_alex.rb for calling the API.
  end
end
