require 'find'
require 'pathname'

class DirectorySearch

  attr_reader:file_paths,:file_name_exp,:file_name_conf
  @file_name=[]
  def intialize()

  end

  def get_file_path_list(root_dir)
    @file_paths=[]
    @file_name_exp=[]
    @file_name_conf=[]
    begin
      Find.find(root_dir) do |conf_dir|
        if(conf_dir =~ /\/conf$/i || conf_dir =~ /\/conf\.txt$/i)
          path=conf_dir.to_s.split("/")
          path=path[0...path.length-1].join("/")
          base_directory=path
          Find.find(base_directory) do |exp_dir|
            if( exp_dir =~ /\/expected_data$/i || exp_dir =~ /\/expected_data\.txt$/i)

            @file_paths << base_directory.to_s
            @file_name_exp << exp_dir.to_s
            @file_name_conf << conf_dir.to_s

            else
            next
            end
          end
        else
        next

        end
      end
      @file_name_conf
    rescue Exception => e
      puts e.message
    end
  end

end

