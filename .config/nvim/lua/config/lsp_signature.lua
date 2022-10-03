
local signature_config = {
    log_path = vim.fn.expand("$HOME") .. "/tmp/sig.log",
    debug = true,
    hint_enable = false,
    handler_opts = { border = "single" },
    max_width = 80,
    toggle_key = '<M-x>',
}

require("lsp_signature").setup(signature_config)