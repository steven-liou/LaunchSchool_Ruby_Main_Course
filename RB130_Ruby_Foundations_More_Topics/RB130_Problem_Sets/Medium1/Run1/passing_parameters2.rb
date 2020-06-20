def group(array)
  yield(array)
end

group(%w(raven finch hawk eagle)) {|_, _, *raptors| p raptors}