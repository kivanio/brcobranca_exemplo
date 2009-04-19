#shairon.toledo@gmail.com
#http://www.hashcode.eti.br
module ParseLine::CSV
  
  self.class_eval do
    
    def csv_layout(options={:delimiter => ';'},&block)
      self.send(:class_variable_set,:@@parse_delimiter,Regexp.new(options[:delimiter])) unless self.class_variable_defined?(:@@parse_values)
      yield self
    end
     
    def parse_field(field,block=nil)
      self.send(:class_variable_set,:@@parse_values,[]) unless self.class_variable_defined?(:@@parse_values)
      self.send(:class_variable_get,:@@parse_values) << [field,block]
    end

    def field(field,block=nil)
      parse_field(field,block)
    end
    def ignore_field
      
      parse_field(:__ignored__)
    end
    
    def load_lines(filepath)
      
      File.open(filepath).map{|line| load_line(line)}
        
    end
    def load_line(line)
      begin
        this=self.new
        #puts this.inspect
        bits_line=line.to_s.split(self.send(:class_variable_get,:@@parse_delimiter)).flatten
          
          
        self.send(:class_variable_get,:@@parse_values).each_with_index do |field,i|
          if field[0] != :__ignored__
            if field[1] # it's block
              this.send "#{field[0]}=", field[1].call(bits_line[i])
            else
              this.send "#{field[0]}=", bits_line[i].to_s.strip
            end
          else
          end
        
        end
        #puts this.inspect
        this
      rescue => e
        raise "[#{e}]ParseLine::MalformedLayoutOrLine: '#{line.to_s.strip}', size: #{line.to_s.size}"
      end
      #puts bits_line
    end
    
  end
  
end