# Homepage (Root path)
get '/' do
  erb :index
end

post '/sequence' do
  @sequence = Sequence.new
  @sequence.sequence_array = @sequence.generate(params[:time], params[:start], params[:focus])
  @sequence.save
end