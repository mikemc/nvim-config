-- require() will only source when vim is first loaded
-- load() will resource the file when this file is sourced
local load = function(mod)
  package.loaded[mod] = nil
  require(mod)
end

-- load "user.init"
require "user.init"
