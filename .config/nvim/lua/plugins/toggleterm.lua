return {
    "akinsho/toggleterm.nvim",
    keys = {
        {
            "<leader>i",
            "<cmd>ToggleTerm size=40 direction=float<cr>",
            desc = "Toggle Floting Terminal"
        },
        {
            "<A-i>",
            "<ESC><ESC><cmd>ToggleTerm size=40 direction=float<cr>",
            desc = "Toggle Floting Terminal"
        },
        {
            "<leader>I",
            "<cmd>:ToggleTerm size=15 direction=horizontal<cr>",
            desc = "Toggle Terminal"
        }
    },
    config = function()
        require("toggleterm").setup{}
    end
}