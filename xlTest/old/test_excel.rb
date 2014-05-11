require 'roo'
load 'error_property.rb'
class TestExcel
  
  attr_reader:error_list
  def excel_read(config_data, expected_data,file_path)
 
 
 
        @error_list=[]
        
        start_line=config_data['start_line'].to_i
        source_name=config_data['source_file']
        source_dir=file_path+"/"+source_name
        puts source_dir
       
        if source_dir=~/\.xlsx$/
          excel_file = Roo::Excelx.new(source_dir)
       elsif source_dir=~/\.xls$/
        excel_file = Roo::Excel.new(source_dir)
        end
        end_line=excel_file.last_row.to_i
       # puts end_line
       current_row=start_line
       
      headers=Hash.new
      excel_file.row(start_line).each_with_index {|header,i|
              headers[header] = i
              p header
              p i
            end
       
      (start_line..end_line).each do |line|
        
          expected_data.each do |exp_data|
            
            regex=Regexp.new(Regexp.escape(exp_data.data_format.to_s))
            regex=exp_data.data_format.to_s
           curr_col=exp_data.col_name.upcase.gsub("COLUMN","").strip
           
         
            excel_data_type= excel_file.celltype(current_row,curr_col)
            curr_cell=excel_file.cell(line,curr_col)
           if(exp_data.is_required.downcase.eql?("true") && excel_file.empty?(current_row,curr_col))
              save_error_data(current_row.to_s,curr_col,curr_cell,"is_required")
                 @error_list << error_data
            
           elsif(exp_data.data_type.downcase.eql?(excel_data_type.to_s)!=true && !curr_cell.nil? )
              #p curr_cell 
             puts "#{excel_data_type}  instead of #{ exp_data.data_type.downcase} col name:#{curr_col}" 
                
                 save_error_data(current_row.to_s,curr_col,curr_cell,"datatype")
             
           elsif ((!exp_data.data_format.to_s.downcase.eql?("null")) && (curr_cell.to_s.match(regex).nil?) && (!curr_cell.nil?))
             
             puts curr_cell.to_s.match(exp_data.data_format.to_s).nil?
             puts curr_cell+ " dataformat mismatch: "+exp_data.data_format+" col:"+curr_col
                  error_data=ErrorProperty.new
                 error_data.row=current_row.to_s
                 error_data.column=curr_col
                 error_data.data=curr_cell
                 error_data.error_type="dataformat"
                 @error_list << error_data
           else 
                  puts "no error  col name:#{curr_col}" 
                 
               save_error_data(current_row.to_s,curr_col,curr_cell,"noerror")
             
             
             @error_list << error_data
                 
           end
         end    
           current_row+=1
        
      end 
      @error_list 
    end
    
    def save_error_data(row,col,data,error)
       error_data=ErrorProperty.new
                  error_data.row=row
                  error_data.column=col
                  error_data.data=data
                  error_data.error_type=error
                 @error_list << error_data
      
    end
    
    
  end
  #(curr_cell.to_s.match(exp_data.data_format.to_s).nil?)






