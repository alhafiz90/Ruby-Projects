load 'config_reader.rb'
load 'expected_data_reader.rb'
load 'directory_search.rb'
load 'test_excel.rb'
load 'global_conf_reader.rb'
load 'report.rb'
require 'date'

class TestOrganizer
  def recursive_test_on_dir()

    begin
      home_dir=Dir.pwd.to_s
      search_dir=DirectorySearch.new
      config_file_list=search_dir.get_file_path_list(home_dir)
      expected_file_list=search_dir.file_name_exp
      common_dir_list=search_dir.file_paths
      for i in 0...config_file_list.length

        run_test_for_each_module(config_file_list[i],expected_file_list[i],common_dir_list[i])
      end

    rescue Exception => e
      puts e.message
      puts e.backtrace.inspect
    end
  end

  def run_test_for_each_module(conf_directory,expected_data_dir,file_path)

    begin
      config_read=LocalConfigReader.new
      exp_data_read=ExpectedResultReader.new
      config_read.config_read(conf_directory)
      config_data=config_read.config_data
      exp_data_read.expected_data_read(expected_data_dir)
      exp_data=exp_data_read.expected_data
      if(config_data['data_source_type'].eql?("file_system"))
        test_file_system(config_data,exp_data,file_path)
      elsif(config_data['data_source_type'].eql?("url"))
        puts file_path +" not implemented yet for url "
      elsif(config_data['data_source_type'].eql?("database"))
        puts file_path +" not implemented yet for database "
      end
    rescue Exception => e
      puts e.message
    end
  end

  def test_file_system(config_data,exp_data,file_path)
    begin
      test_excel=TestExcel.new
      #puts file_path
      @error_result=[]
      @error_result= test_excel.excel_read_to_find_error(config_data,exp_data,file_path)
     #print_error_result(@error_result)
      col_headers=test_excel.column
      
     report=ReportGenerator.new
     report.generate_html_report(file_path,@error_result,col_headers)
    rescue Exception => e
      puts e.message
    end
  end
def print_error_result(error_list)
          error_list.each do |error|
             puts "Row:#{error.row} Col:#{error.column} Data:#{error.data} Error type:#{error.error_type} Expected result:#{error.expected}\n"
end
end

end

  
a=TestOrganizer.new
a.recursive_test_on_dir


 