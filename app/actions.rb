require 'json'

get '/' do
  erb :index
end

post '/generate' do
  status 200
  @sequence = Sequence.new
  @sequence.sequence_array = @sequence.generate(params[:time].to_i, params[:start], params[:focus])
  @sequence.save
  # redirect '/'
end

get '/generate' do
  status 200
  @sequence = Sequence.last.sequence_array
  # redirect '/'

end

post '/rating' do
  status 200
  @sequence = Sequence.last
  @sequence.rating = params[:rating]
  @sequence.save
  redirect 
end

get '/rating' do
  status 200
  @sequence = Sequence.where(rating: 5).order("RANDOM()").last.sequence_array
  # redirect '/'
end