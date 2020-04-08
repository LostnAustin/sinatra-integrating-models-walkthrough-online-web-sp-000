require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    @analyzed_text = TextAnalyzer.new(params[:user_text])
    @count_of_words = @analyzed_text.count_of_words
    @count_of_vowels = @analyzed_text.count_of_vowels
    @count_of_consonants = @analyzed_text.count_of_consonants
    @most_used_letter = @analyzed_text.most_used_letter.first[0].upcase
    @most_used_letter_count = @analyzed_text.most_used_letter.first[1].to_i
# binding.pry
    erb :results
  end
end
