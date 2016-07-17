get "/" do
	erb :index
end

get "/sign_out" do
	session[:id] = nil
	redirect "/"
end
