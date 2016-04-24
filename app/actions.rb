require 'json'
require 'pry'

get '/' do
  erb :index
end

post '/generate' do
  @sequence = Sequence.new
  @sequence.sequence_array = @sequence.generate(params[:time].to_i, params[:start], params[:focus])
  # binding.pry
  @sequence.save
end

get '/generate' do
  @sequence = Sequence.last.sequence_array
  ## TO DO @sequence.rating = (params[:rating])
  # binding.pry
end

post '/rating' do
  @sequence = Sequence.last
  # binding.pry
  @sequence.rating = params[:rating]
  @sequence.save
end

get '/rating' do
  binding.pry
  @sequence = Sequence.where(rating: 4..5).order(rating: :desc)
  @sequence
end