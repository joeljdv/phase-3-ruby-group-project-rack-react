class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    binding.pry
    if req.path.match(/test/) 
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]
    elsif req.path.match(/directors/)
      directors = Director.all
      return [200, { 'Content-Type' => 'application/json' }, [directors.to_json ]]
    else
      resp.write "Path Not Found"

    end

    resp.finish
  end

end
