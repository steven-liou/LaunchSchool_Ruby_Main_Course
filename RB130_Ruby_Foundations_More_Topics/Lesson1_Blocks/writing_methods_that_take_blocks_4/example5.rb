# if passing the block with more arugments than the block expects, the extra arguments are ignored

def test
  yield(1, 2)
end

test { |num| puts num }


