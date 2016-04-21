# Homepage (Root path)

require 'pry'

get '/' do
  erb :index
end

post '/generate' do
  @sequence = Sequence.new
  @sequence.sequence_array = @sequence.generate(params[:time].to_i, params[:start], params[:focus])
  @sequence.save
end

get '/generate' do
  redirect '/'
end