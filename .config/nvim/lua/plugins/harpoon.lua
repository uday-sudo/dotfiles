return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim"  },
    config = function ()
        local harpoon = require('harpoon')
        harpoon:setup({})

        -- basic telescope configuration
        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
            }):find()
        end
    --Keymaps
        vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end, { desc = "Append Item to harpoon list" })
        vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })

        vim.keymap.set("n", "fh", function() harpoon:list():select(1) end, { desc = "Harpoon List Select 1" })
        vim.keymap.set("n", "fj", function() harpoon:list():select(2) end, { desc = "Harpoon List Select 2" })
        vim.keymap.set("n", "fk", function() harpoon:list():select(3) end, { desc = "Harpoon List Select 3" })
        vim.keymap.set("n", "fl", function() harpoon:list():select(4) end, { desc = "Harpoon List Select 4" })

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "fp", function() harpoon:list():prev() end, { desc = "Harpoon List Previous" })
        vim.keymap.set("n", "fo", function() harpoon:list():next() end, { desc = "Harpoon List Next" })
    end
}
