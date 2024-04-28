# typed: true

# See https://docs.openalex.org/
# NOTE: You may run into rate limit errors (Status: 429)
# It is recommended you add a `sleep` in the short term, and once you've completed everything else you can come back
# and implement a rate limiter or backoff/retry mechanism if you have time.
class OpenAlex
  extend T::Sig

  sig { void }
  def initialize
    @client =
      HTTP.persistent('https://api.openalex.org').headers( # Only the top-level is supported, you add /v1/api/ later
        'Accept' => 'application/json',
        'Content-Type' => 'application/json',
        'User-Agent' => "Halo Science, mailto:engineers@halo.science",
      )
  end

  sig { params(author_id: String).returns(T::Hash[String, T.untyped]) }
  def author(author_id)
    response = @client.get("/authors/#{author_id}")
    response.parse
  end

  sig { params(query: String).returns(T::Hash[String, T.untyped]) }
  def search(query)
    response = @client.get("/works", params: { search: query })
    response.parse
  end

  sig { params(author_id: String).returns(T::Hash[String, T.untyped]) }
  def author_works(author_id)
    response = @client.get("/works", params: { filter: "authorships.author.id:#{author_id}" })
    response.parse
  end

  sig { void }
  def close
    @client.close
  end
end
