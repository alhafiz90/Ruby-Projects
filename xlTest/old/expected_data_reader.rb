
load 'result_property.rb'

class ExpectedResultReader
  
  attr_accessor:expected_data
  def expected_data_read(file_path)
    @expected_data=[]
    expected_data_file=File.open(file_path,'r')
       
     while !expected_data_file.eof
          line=expected_data_file.readline
         
          if line=~/^#/
            next
           elsif line =~ /^column/i
             
          data=line.split(/[=,]/)
          result_property=ResultProperty.new
          result_property.col_name=data[0].to_s.strip.downcase
          result_property.data_type=data[1].to_s.strip.downcase
          result_property.is_required=data[2].to_s.strip.downcase
          result_property.data_format=data[3].to_s.strip
          
       
         @expected_data  << result_property
          
        
            
          end
        end
        expected_data_file.close
         @expected_data
end  
  
  
end

=begin
local=ExpectedResultReader.new
hash=[]
hash=local.expected_data_read("/home/abdullah.hafiz/xlTest/test_data/module_3/expected_data")

hash.each do|value|  
puts value.col_name+  " --------------  " 



end
=end