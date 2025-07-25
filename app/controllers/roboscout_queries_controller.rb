# typed: true

class RoboscoutQueriesController < ApplicationController
  def index
    @roboscout_queries = RoboscoutQuery.order(created_at: :desc).all
  end

  def create
    @query =
      RoboscoutQuery.create!(query: params[:query], status: 'in_progress')
    StartRoboscoutQueryJob.perform_async(T.must(@query.id))

    render json: { query: @query }
  end

  def show
    @query = RoboscoutQuery.find(params[:id])
  end

  def people
    query = RoboscoutQuery.find(params[:id])

    @roboscout_query_people =
      query.roboscout_query_person.order(relevance: :desc).includes(:person)

    render 'people'
  end
end
