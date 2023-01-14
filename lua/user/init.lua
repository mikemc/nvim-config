-- https://vonheikemen.github.io/devlog/tools/build-your-first-lua-config-for-neovim/

-- require() will only source when vim is first loaded
-- load() will resource the file when this file is sourced
local load = function(mod)
  package.loaded[mod] = nil
  require(mod)
end

-- require "user.impatient"
load "user.options"
load "user.keymaps"
load "user.commands"
require "user.plugins"
-- Plugin configuration
require "user.telescope"
require "user.treesitter"
require "user.comment"
