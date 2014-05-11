class GlobalConfigReader
 
  attr_reader:parallel_execution
  

  def config_read(file_path)
     
       
     begin
     
        config_file=File.open(file_path,'r')
        while !config_file.eof
          line=config_file.readline
          puts line
          if line=~/^# /
            next
           elsif line =~ /^no_of_parallel_execution/i
          data=line.split("=")
          @parallel_execution=data[1].to_i if data[1].match(/^\d+$/)
          
         
            
          end
        end
        config_file.close
        rescue 
          puts "error"
        end
  end
  
  
  end
 
=begin
  a=GlobalConfigReader.new
  a.config_read("/home/abdullah.hafiz/xlTest/global_conf")
  puts a.parallel_execution
=end