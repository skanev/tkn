code = File.read(File.dirname(__FILE__) + '/constants.rb')

NAMES = {}

pattern = /^([A-Z_]+)\s+=\s+(.*?)(?:\n\n|\Z|\n(?=[A-Z]))/m
code.scan(pattern) do
  NAMES[$1] = $2.gsub(/\s+/, ' ')
end

def expand(name)
  text = NAMES.fetch(name)

  while text =~ /[A-Z_]+/
    text = text.gsub(/([A-Z_]+)/) { NAMES.fetch $1 }
  end

  text
end

puts expand 'SOLUTION'
