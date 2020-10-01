class Application 
  
  def call(env)
    resp = Rack::Response.new 
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      item_name = 
      if @@items.include?(search_term)
        resp.write "#{search_term.price}"
        resp.status = 200
      else 
        resp.write "We don't have that item"
        resp.status = 400
      end 

    else 
      resp.write "Route not found"
      resp.status = 404 
    end 
    
    resp.finish 
  end
  
end 