require 'roo'

load 'error_property.rb'
require 'date'

class TestExcel

  attr_reader:error_list
  attr_reader:column
  def excel_read_to_find_error(config_data, expected_data,file_path)

    @error_list=[]
    begin
      start_line=config_data['start_line'].to_i
      source_name=config_data['source_file']
      source_dir=file_path+"/"+source_name
      #puts source_dir

      if source_dir=~/\.xlsx$/
        @excel_file = Roo::Excelx.new(source_dir)
      elsif source_dir=~/\.xls$/
        @excel_file = Roo::Excel.new(source_dir)
      end
      end_line=@excel_file.last_row.to_i

      current_row=start_line

      @col_headers=Hash.new
      @column=Hash.new
      @excel_file.row(start_line-1).each_with_index {|header,i| @col_headers[header.strip] = i+1}

      (start_line..end_line).each do |line|

        expected_data.each do |exp_data|

          regex=Regexp.new(Regexp.escape(exp_data.data_format.to_s))
          regex=exp_data.data_format.to_s

          if exp_data.col_name=~/^col/i
            curr_col=exp_data.col_name.upcase.gsub("COLUMN","").strip
          @column[exp_data.col_name]=exp_data.col_name
          #puts  curr_col
          else
          #puts exp_data.col_name
          curr_col=@col_headers.fetch(exp_data.col_name)
          @column[exp_data.col_name]=curr_col
          end

          excel_data_type= @excel_file.celltype(current_row,curr_col)
          curr_cell=@excel_file.cell(line,curr_col)
          if(exp_data.is_required.eql?("true") && @excel_file.empty?(current_row,curr_col))
            #puts "Row:#{current_row} Col:#{curr_col} data field empty error"
            save_error_data(current_row,curr_col,"isrquired",exp_data.data_type,exp_data.col_name)

          #elsif(exp_data.data_type.downcase.eql?(excel_data_type.to_s)!=true && !curr_cell.nil? )

          elsif(validate_datatype(exp_data.data_type,current_row,curr_col)==false && !curr_cell.nil? )

            #puts "Row:#{current_row} Col:#{curr_col} data type error:  does not have #{ exp_data.data_type.downcase}"

            save_error_data(current_row,curr_col,"datatype",exp_data.data_type,exp_data.col_name)

          elsif ((!exp_data.data_format.to_s.downcase.eql?("null")) && (curr_cell.to_s.match(regex).nil?) && (!curr_cell.nil?))

            #puts "Row:#{current_row} Col:#{curr_col} dataformat(Regex) mismatch error: data: #{curr_cell} expected regex form: #{exp_data.data_format}"
            save_error_data(current_row,curr_col,"dataformat",exp_data.data_format,exp_data.col_name)
          else
          #puts "Row:#{current_row} Col:#{curr_col} no error"
            save_error_data(current_row,curr_col,"noerror",exp_data.data_type,exp_data.col_name)

          end
        end
        current_row+=1

      end
    rescue Exception => e
      puts e.message
    end
    @error_list
  end

  def validate_datatype(data_type,row,col)
    begin
      xl_data=@excel_file.cell(row,col)
      xl_data_type= @excel_file.celltype(row,col)
      #return  true if data_type=~/^float/i && xl_data=~/^[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?$/
      return  true if data_type=~/^number/i && xl_data=~/^\d$/
      return  true if data_type=~/^date$/i && xl_data=~/(\d{1,2}[-\/]\d{1,2}[-\/]\d{4})|(\d{4}[-\/]\d{1,2}[-\/]\d{1,2})/
      #regex for date=/((([3][0-1])|([0-2]?[0-9]))[-\/](([3][0-1])|([0-2]?[0-9]))[-\/]\d{4})|(\d{4}[-\/](([3][0-1])|([0-2]?[0-9]))[-\/](([3][0-1])|([0-2]?[0-9])))/
      return  true if data_type=~/^datetime/i && xl_data=~/^1?\d{1}\/[123]?\d{1}\/\d{4}(\s[12]?\d:[0-5]\d(:[0-5]\d)?(\s[ap]m)?)?$/

      #return  true if data_type=~/^datetime/i && validate_date(xl_data)==true
      return  true if data_type=~/currency/i && xl_data=~/\d+[,.]\d+/
      return  true if data_type.to_s.downcase.eql?(xl_data_type.to_s.downcase)
      return false
    rescue Exception => e
      puts e.message
    end
  end

  def validate_date(date_str)
    d=true
    d = DateTime.parse(date_str) rescue false
    puts "valid" if d==true
    return d

  end

  def save_error_data(row,col,error,exp,header)
    data=@excel_file.cell(row,col)
    error_data=ErrorProperty.new
    error_data.row=row
    error_data.column=col
    error_data.data=data
    error_data.error_type=error
    error_data.expected=exp

    error_data.header=header

    @error_list << error_data

  end

end

