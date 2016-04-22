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
  # redirect '/'
  @sequence = Sequence.last.sequence_array
  # binding.pry
end