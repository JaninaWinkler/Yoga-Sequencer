require 'json'

get '/' do
  erb :index
end

post '/generate' do
  @sequence = Sequence.new
  @sequence.sequence_array = @sequence.generate(params[:time].to_i, params[:start], params[:focus])
  @sequence.save
end

get '/generate' do
  @sequence = Sequence.last.sequence_array

end

post '/rating' do
  @sequence = Sequence.last
  @sequence.rating = params[:rating]
  @sequence.save
end

get '/rating' do
  @sequence = Sequence.where(rating: 5).order("RANDOM()").last.sequence_array
end