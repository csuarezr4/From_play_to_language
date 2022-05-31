## Parameters
input_folder = '~/Desktop/Datavyu'
output_file = '~/Desktop/Data.csv'
column_to_search = 'transcribe'
code_to_search = 'content'
csv_path = '~/Desktop/Catalinas_words.csv'
require 'csv'
key_words = CSV.read(File.expand_path(csv_path)).flatten


code_map = {
  'id' => %w[participant],
  'transcribe' => %w[source ordinal onset content] }

static_columns = %w[id]

sequential_columns = %w[transcribe]

all_cols = [static_columns, sequential_columns].flatten

col_header = lambda do |map, col|
  map[col].map { |x| "#{col}_#{x}" }
end.curry.call(code_map)

header = [all_cols.flat_map(&col_header),key_words].flatten

delimiter = ','

data = CSV.new(String.new, write_headers: true, headers: header, col_sep: delimiter)

input_path = File.expand_path(input_folder)

infiles = Dir.chdir(input_path) { Dir.glob('*.opf') }

require 'Datavyu_API.rb'

infiles.sort.each do |infile|

  $db, $pj = load_db(File.join(input_path, infile))

  puts "Printing #{infile}..."

  d_static = []
  static_columns.each do |s|
    scol = get_column(s)
    scell = scol.cells.first
    code_map[s].each do |c|
      d_static << scell.get_code(c)
    end
  end


  code_map.each do |k,x|
    if sequential_columns.include?(k)
      kcol = get_column(k)
      kcol.cells.each do |kcell|
        row = []
        x.each do |xi|
          row << kcell.get_code(xi)
        end
        if k == column_to_search
          d_presence = key_words.map{ |word| !!(kcell.get_code(code_to_search) =~ /\b#{word}.*/i)}
        else
          d_presence = []
        end
        row = [d_static, row, d_presence].flatten
        data << row
      end
    end
  end
end

#variations to line 62:
#joey's: d_presence = key_words.map{ |word| kcell.get_code(code_to_search).include?(" " + word + " ") }
#Cata's includes all matches: d_presence = key_words.map{ |word| !!(kcell.get_code(code_to_search) =~ /#{word}/)}
#Cata's includes words that start with the pattern: d_presence = key_words.map{ |word| !!(kcell.get_code(code_to_search) =~ /\b#{word}/)}
#Cata's includes words that have other endings: d_presence = key_words.map{ |word| !!(kcell.get_code(code_to_search) =~ /\b#{word}.*/)}

d_presence=key_words.map{|word| !!('the dog is playing' =~ /\b#{word}.*/)}

puts 'Writing data to file...'
outfile = File.open(File.expand_path(output_file), 'w+')
outfile.puts data.string
outfile.close

puts 'Finished.'
