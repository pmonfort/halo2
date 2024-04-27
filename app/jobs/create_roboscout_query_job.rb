# typed: true

class CreateRoboscoutQueryJob < ApplicationJob
  extend T::Sig
  include Sidekiq::Job

  sig { params(query: String).void }
  def perform(query)
    # TODO: Start the job that will search.
  end
end
