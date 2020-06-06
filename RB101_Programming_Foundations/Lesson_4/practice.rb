
require 'pry'


munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}



munsters.map do |monster, attr| 
  binding.pry
  case attr["age"]
  when 0..17
   attr['age_group'] = 'kid'
  when 18..64
   attr['age_group'] = 'adult'
  else 
   attr['age_group'] = 'senior'
  end
end

p munsters