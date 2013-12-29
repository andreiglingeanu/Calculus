class Calculus < Sinatra::Application
  register Sinatra::Reloader

  get '/' do
    erb :index, layout: :main
  end

  get '/query' do
    query = params[:q]
    unless query.blank?
      result = Solver.new(query).all
      erb :result, layout: :main,
        locals: { query: query, result: result }
    else
      erb :notfound, layout: :main
    end
  end

  set :public_folder, File.dirname(__FILE__) + '/static'
end
