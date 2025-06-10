-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- import/override with your plugins folder

  -- Auto restore session https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/recipes/auto-session-restore
  { import = "astrocommunity.recipes.auto-session-restore" },

  -- Auto save https://github.com/AstroNvim/aauto-session-restorestrocommunity/blob/main/lua/astrocommunity/editing-support/auto-save-nvim
  { import = "astrocommunity.editing-support.auto-save-nvim" },

  -- Transparent https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/color/transparent-nvim
  -- { import = "astrocommunity.color.transparent-nvim" },

  -- OneDarkPro theme https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/colorscheme/onedarkpro-nvim
  { import = "astrocommunity.colorscheme.onedarkpro-nvim" },

  -- TokyoNight theme https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/colorscheme/tokyonight-nvim
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },

  -- Catppuccin theme https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/colorscheme/catppuccin
  { import = "astrocommunity.colorscheme.catppuccin" },

  -- Golang https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/pack/go
  { import = "astrocommunity.pack.go" },

  -- Golang CI Lint https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/pack/golangci-lint
  { import = "astrocommunity.pack.golangci-lint" },

  -- JS/TS https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/pack/typescript
  { import = "astrocommunity.pack.typescript" },

  -- HTML/CSS https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/pack/html-css
  { import = "astrocommunity.pack.html-css" },

  -- Tailwindcss https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/pack/tailwindcss
  { import = "astrocommunity.pack.tailwindcss" },

  -- Terraform https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/pack/terraform
  { import = "astrocommunity.pack.terraform" },

  -- YAML https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/pack/yaml
  { import = "astrocommunity.pack.yaml" },

  -- Git Diffview https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/git/diffview-nvim
  { import = "astrocommunity.git.diffview-nvim" },

  -- Git blame https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/git/git-blame-nvim
  { import = "astrocommunity.git.git-blame-nvim" },

  -- Git Interface NeoGit https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/git/neogit
  { import = "astrocommunity.git.neogit" },

  -- Git Graph https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/git/gitgraph-nvim
  { import = "astrocommunity.git.gitgraph-nvim" },

  -- Tabout https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/motion/tabout-nvim
  -- { import = "astrocommunity.motion.tabout-nvim" },

  -- Opiniated better than below Smoother scrolling https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/scrolling/vim-smoothie
  { import = "astrocommunity.scrolling.vim-smoothie" },
  -- Smoother scrolling https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/scrolling/neoscroll-nvim
  -- { import = "astrocommunity.scrolling.neoscroll-nvim" },

  -- NOTE: Overrided in `plugins/hop.lua`, mainly because the key mappings
  -- Hop-nvim, like EasyMotion since the community does not have EasyMotion https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/motion/hop-nvim/init.lua
  -- { import = "astrocommunity.motion.hop-nvim" },

  -- NOTE: This does not have scroll functionality, copied from community repo and modified some mappings, see below comments
  -- Hover https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/utility/hover-nvim
  -- { import = "astrocommunity.utility.hover-nvim" },

  -- Surround motion lua/astrocommunity/motion/mini-surround
  { import = "astrocommunity.motion.mini-surround" },

  -- Docker terminal https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/docker/lazydocker
  { import = "astrocommunity.docker.lazydocker" },

  -- Markdown preview https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/markdown-and-latex/markdown-preview-nvim
  { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },

  -- Render markdown https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/markdown-and-latex/render-markdown-nvim
  { import = "astrocommunity.markdown-and-latex.render-markdown-nvim" },
}
