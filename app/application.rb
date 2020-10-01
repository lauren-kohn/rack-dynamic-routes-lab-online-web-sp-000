class Application 
  
  def call(env)
    resp = Rack::Response.new 
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      search_term = req.params["item"]
      if @@items.include?(search_term)
        resp.write "#{search_term.name}"
        resp.status = 200
      else 
        resp.write "We don't have that item"
        resp.status = 400
      end 

    else 
      resp.write "Item not found"
      resp.status = 400 
    end 
    
    resp.finish 
  end
  
end 