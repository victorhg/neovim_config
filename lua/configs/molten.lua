return function()
      -- this is an example, not a default. 
      -- Please see the readme for more configuration options
      -- MUDAR PARA AALGO MAAIS GENERIICO!!!
      --vEnv = "/opt/homebrew/anaconda3/envs/firstTest/share/jupyter/kernels/python3"
     -- vEnv = "/opt/homebrew/anaconda3/envs/firstTest/bin/python3"
    --vim.g.python3_host_prog=vim.fn.expand(vEnv)

      -- I find auto open annoying, keep in mind setting this option will require setting
      -- a keybind for `:noautocmd MoltenEnterOutput` to open the output again
      vim.g.molten_auto_open_output = false

      -- this guide will be using image.nvim
      -- Don't forget to setup and install the plugin if you want to view image outputs
      vim.g.molten_image_provider = "image.nvim"

      -- optional, I like wrapping. works for virt text and the output window
      vim.g.molten_wrap_output = true

      -- Output as virtual text. Allows outputs to always be shown, works with images, but can
      -- be buggy with longer images
      vim.g.molten_virt_text_output = true

      -- this will make it so the output shows up below the \`\`\` cell delimiter
      vim.g.molten_virt_lines_off_by_1 = true
    end
