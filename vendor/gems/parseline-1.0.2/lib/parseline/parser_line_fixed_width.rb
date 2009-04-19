#shairon.toledo@gmail.com
#http://www.hashcode.eti.br
module ParseLine::FixedWidth
  
  self.class_eval do
    
    def fixed_width_layout(&block)
      yield self
    end
    
    def parse_field(field,range,block=nil)
      self.send(:class_variable_set,:@@parse_values,[]) unless self.class_variable_defined?(:@@parse_values)
      self.send(:class_variable_get,:@@parse_values) << [field,range,block]
    end

    def field(field,range,block=nil)
      parse_field(field,range,block)
    end
    
    def load_lines(filepath)
      
      File.open(filepath).map{|line| load_line(line)}
        
    end
    def load_line(line)
      this=self.new
      begin
        self.send(:class_variable_get,:@@parse_values).each do |params|
          if params[2] # it's block
            this.send "#{params[0]}=", params[2].call(line[params[1]])
          else
            this.send "#{params[0]}=", line[params[1]].to_s.strip
          end
        end
        this
      rescue
        raise "ParseLine::MalformedLayoutOrLine: '#{line.to_s.strip}', size: #{line.to_s.size}"
      end
    end
    
  end
  
end

