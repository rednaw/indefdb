require 'hippie_csv'
require 'daru/view'
require 'tempfile'
require 'yaml'

module IndefDB
  class Web

    def navigator()
      result = "<div id='navigator'>\n"
      result += menu('filters', 1)
      result += "</div>\n"
      return result
    end

    def title(filter)
      if filter.nil? or filter == '' or ! File.file? filter
       result = 'Displaying entire dataset, select a filter to narrow down results.'
      else
        yaml = YAML.load_file(filter)
        result = yaml['description']
        if result.nil? or result == ''
          result = 'Empty description, please add one to your filter'
        end
      end
      return result
    end

    def details(filter)
      Tempfile.create('cleaned_data') { |cleaned_data_file| 
        CSV.open(cleaned_data_file, 'w') { |rows|
          HippieCSV.read('data/indefdb-annotated.csv').each { |row| 
            rows << row
          }
        }
        dataframe = Daru::DataFrame.from_csv(cleaned_data_file, headers: true, header_converters: :downcase)
        if File.file? filter
          dataframe = filter(dataframe, filter)
        end
        return Daru::View::Table.new(dataframe, pageSize: 25, adapter: :datatables).div
      }
    end

    private

    def filter(dataframe, filter)
      if !filter.nil?
        yaml = YAML.load_file(filter)
        select = yaml['select']

        dataframe = dataframe.filter_rows { |row|
          query = "proc { |row| (" + select.join(') and (') + ") }"
          begin
            eval(query).call(row)
          rescue StandardError => ex
            abort "Error while evaluating\n\n#{query}\n\n#{row.inspect}\n\n#{ex}"
          end        
        }
      end      
      return dataframe
    end

    def menu(start, level)
      result = ''
      tabs = "  " * level
      Dir.foreach(start) do |x|
        path = File.join(start, x)
        if x == "." or x == ".."
          next
        elsif File.directory?(path)
          name = path.split('/').last
          result += %Q(
            #{tabs}<li><span>#{name}</span>
            #{tabs}  <ul>
            #{menu(path, level + 2)}
            #{tabs}  </ul>
            #{tabs}</li>
          )
        else
          if x.end_with? '.yaml'
            linkname = path.split('/').last.gsub('.yaml', '')
            link = "<a href='/#{path}'>#{linkname}</a>"
            result += "#{tabs}<li>#{link}</li>\n"
          end
        end
      end
      return result
    end
      
  end
end