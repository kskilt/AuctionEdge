# frozen_string_literal: true

def blank_string?(hash)
  hash.each do |key, value|
    if value == 'blank'
      hash[key] = nil
    end
  end
end

def partial(make)
  if make.downcase == "fo" || make.downcase == "for"
    make = "Ford"
  elsif make.downcase == "che" || make.downcase == "chev"
    make = "Chevrolet"
  end
  make = make.capitalize
end

def model_trim_split(hash)
  model_trim = hash[:model].split(' ')
  if model_trim.length > 1
    hash[:model] = model_trim.first
    hash[:trim] = model_trim.last
  end
  hash[:model] = hash[:model].capitalize
  hash[:trim] = hash[:trim]&.upcase
end