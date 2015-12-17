
class Solution
  attr_accessor :highest_count_across_lines,:highest_count_words_across_lines,:highwords



  def initialize()
    @highwords=[]

  end

  def analyze_file
    @@analyzers=[]
    line_number=-1
    File.foreach("test.txt") do |line|
     line_number=line_number+1
     lin=LineAnalyzer.new(line,line_number)
      @@analyzers<<lin
    end

  end
  def calculate_line_with_highest_frequency
    high=0
    @@analyzers.each do |pe|
      if high<pe.highest_wf_count
        high=pe.highest_wf_count
      end
    end
    @highest_count_across_lines=high
      @@analyzers.each do |qe|
        if qe.highest_wf_count == high
          qe.yesorno=false
        end
      end

      @@analyzers.reverse_each do |q|
        if q.yesorno== false
          q.highest_wf_words.each do |per|
            @highwords<<per
          end
        end
      end
      highest_count_words_across_lines="#{highwords[0]},#{highwords[1]},#{highwords[2]}"

  end
  def print_highest_word_frequency_across_lines
    puts "The following words have the highest word frequency per line:"
    @@analyzers.each do |per|
      if per.yesorno == false
        puts "#{per.highest_wf_words}(appears in line #{per.line_number})"
      end
  end
  end

end
class LineAnalyzer
  attr_accessor :content,:line_number,:highest_wf_words,:highest_wf_count,:yesorno

    def initialize(line,line_number)
      @highest_wf_words=[]
      @content=line
      @line_number=line_number
      self.calculate_word_frequency
    end
    def calculate_word_frequency()
      arrayofoccur=[]
      prevword=[]
      linee=self.content
      linee=linee.downcase
      words=linee.split
      words.each do |word|
        count=0
        words.each do |wordcom|
          if word == wordcom
            count=count+1
          end
      end
      arrayofoccur<<count
    end
    self.highest_wf_count=arrayofoccur.max
    words.each do |word|
      count=0
      words.each do |wordcom|
        if word == wordcom
          count=count+1
        end
    end
    if count == self.highest_wf_count
      unless prevword.include?word
      highest_wf_words << word
      prevword<<word
    end
    end
  end

end
end
