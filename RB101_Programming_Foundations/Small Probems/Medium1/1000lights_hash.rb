require 'pry'

def initialize_lights(switches)
  lights = {}
  1.upto(switches) { |number| lights[number] = false}
  lights
end

def iterate_swtiches(lights)
  1.upto(lights.size) do |iteration_number|
    toggle_switches(lights, iteration_number)
  end
end

def toggle_switches(lights, nth)
  lights.each do |position, state|
    if position % nth == 0
      lights[position] = !lights[position]
    end
  end
end

def display_lights_on(lights)
  on_lights = lights.select {|_, state| state }
  on_lights.keys
end

lights = initialize_lights(1000)
iterate_swtiches(lights)
p display_lights_on(lights)