class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    # binding.pry
    if req.path.match(/test/) 
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]
    elsif req.path.match(/movies/)
      if req.env["REQUEST_METHOD"] =="POST"
        input = JSON.parse(req.body.read)
        director_id = req.path.split('/directors/').last.split("/movies").last
        director = Director.find_by(id: director_id)
        movie = director.movies.create(name: input["name"])
        return [200, { 'Content-Type' => 'application/json' }, [movie.to_json ]]
      end
    elsif req.path.match(/directors/)
      if req.env["REQUEST_METHOD"] == "POST"
        input = JSON.parse(req.body.read)
        director = Director.create(name: input["name"])
        return [200, { 'Content-Type' => 'application/json' }, [director.to_json ]]
      else 
        if req.path.split('/directors').length == 0
          return [200, { 'Content-Type' => 'application/json' }, [Director.all.to_json ]]
        else
          director_id = req.path.split('/directors/').last
          return [200, { 'Content-Type' => 'application/json' }, [Director.find_by(id: director_id).to_json({:include => :movies}) ]]
        end 
      end
    else
      resp.write "Path Not Found"

    end

    resp.finish
  end

end
