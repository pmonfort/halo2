# typed: true

class RoboscoutQueriesController < ApplicationController
  def index
    # TODO: Get all the Roboscout queries from the database.
    @roboscout_queries = [
      RoboscoutQuery.new(status: 'complete', id: 1, query: 'test query')
    ]
  end

  def create
    # TODO: Complete this method.
  end

  def show
    # TODO: Complete this method.
    # @query = ...
  end

  def people
    # TODO: Complete this method.
    # @people = ...
  end
end
