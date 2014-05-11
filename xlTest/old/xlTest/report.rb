require 'fileutils'

class ReportGenerator
  def generate_html_report(file_path,data,headers)
   begin
    path= file_path.split("/")
    module_name=path[path.length-1]
    path=path[0..path.length-3]
    new_dir=path.join("/")
    new_dir=new_dir+"/test_report/"+module_name
    file_name=new_dir+"/report.html"
    #puts file_name
    #puts new_dir
    FileUtils.mkdir_p(new_dir) unless File.exists?(new_dir)

    fileHtml = File.new(file_name, "w+")
    fileHtml.puts "<HTML><BODY BGCOLOR='white'>"
    fileHtml.puts "<CENTER>Test RESULT</CENTER>"
    fileHtml.puts "</BODY></HTML>"
    fileHtml.puts "<table border='3' style='width:600px' > <tr>"
=begin   
 fileHtml.puts "<tr>"
   headers.each do |key,value|
      
      fileHtml.puts"<th>"+key.to_s+"</th>"
      fileHtml.puts"<th> Result</th>"
  end
  fileHtml.puts "</tr>"

=end fileHtml.puts "<tr>"
     fileHtml.puts"<th>Column Value</th>"
       fileHtml.puts"<th> Result</th>"
     fileHtml.puts "</tr>"
       #for i in (1..data.length/headers.length)
       for j in (0..data.length-1)
         #for avoiding the  passed result
         next if data[j].error_type.to_s.eql?("noerror")

        fileHtml.puts "<tr>"
            #for j in (0...headers.length)
            
            #fileHtml.puts "<tr>"
              data[j].header.to_s
              #fileHtml.puts"<th>"+data[j].header.to_s+"</th>"
              # fileHtml.puts"<th> Result</th>"
              #fileHtml.puts "</tr>"
              fileHtml.puts"<td>"+data[j].data.to_s+"</td>"
              
              if data[j].error_type.to_s.eql?("isrquired")
                showmsg="Row: #{data[j].row.to_s} Col:#{data[j].header.to_s} can't be empty"
                elsif data[j].error_type.to_s.eql?("datatype")
                   showmsg="Row: #{data[j].row.to_s} Col:#{data[j].header.to_s} Needs to be #{data[j].expected.to_s} "
             elsif data[j].error_type.to_s.eql?("dataformat")
                   showmsg="Row: #{data[j].row.to_s} Col:#{data[j].header.to_s} should match /#{data[j].expected.to_s}/ "
             
              end
              
               fileHtml.puts"<td bgcolor='#FF0000'>"+showmsg.to_s+"</td>" unless data[j].error_type.to_s.eql?("noerror")
               fileHtml.puts"<td bgcolor='#00FF00'>Passed</td>" if data[j].error_type.to_s.eql?("noerror")
              
           # end
                      fileHtml.puts "</tr>"
     end
       
      
     fileHtml.puts "</table> "
    
    

    fileHtml.close()
    rescue Exception => e
      puts e.message
    end

  end

end

