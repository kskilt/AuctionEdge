# frozen_string_literal: true

require 'date'
require './helpers/formatter'

def normalize_data(hash)
  if hash[:year].to_i > 1900 && hash[:year].to_i < (Date.today.year + 2)
    hash[:year] = hash[:year].to_i
    blank_string?(hash)
    hash[:make] = partial(hash[:make])
    model_trim_split(hash)
  end
  hash
end

examples = [[{ :year => '2018', :make => 'fo', :model => 'focus', :trim => 'blank' }, { :year => 2018, :make => 'Ford', :model => 'Focus', :trim => nil }], [{ :year => '200', :make => 'blah', :model => 'foo', :trim => 'bar' }, { :year => '200', :make => 'blah', :model => 'foo', :trim => 'bar' }], [{ :year => '1999', :make => 'Chev', :model => 'IMPALA', :trim => 'st'}, { :year => 1999, :make => 'Chevrolet', :model => 'Impala', :trim => 'ST' }], [{ :year => '2000', :make => 'ford', :model => 'focus se', :trim => '' }, { :year => 2000, :make => 'Ford', :model => 'Focus', :trim => 'SE' }]]

examples.each_with_index do |(input, expected_output), index|
  if (output = normalize_data(input)) == expected_output
    puts "Example #{index + 1} passed!"
  else
    puts "Example #{index + 1} failed,
          Expected: #{expected_output.inspect}
          Got:      #{output.inspect}"
  end
end