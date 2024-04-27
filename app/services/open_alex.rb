# typed: true

# See https://docs.openalex.org/
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

  sig { void }
  def close
    @client.close
  end
end
