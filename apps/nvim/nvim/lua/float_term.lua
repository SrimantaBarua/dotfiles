-- Function to create a floating terminal and run the provided command

function FloatTerm(cmd)
    -- get neovim window dimensions
    local height = vim.api.nvim_get_option("lines")
    local width = vim.api.nvim_get_option("columns")

    -- compute size and position of floating window
    local win_height = math.ceil(height * 0.75)
    local win_width = math.ceil(width * 0.75)
    local win_row = math.ceil(height * 0.125)
    local win_column = math.ceil(width * 0.125)

    -- vim.api.nvim_command(":echom Hello")

    -- create a new scratch  buffer
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_var(buf, "signcolumn", "no")
    vim.api.nvim_buf_set_option(buf, "buftype", "nofile")

    -- settings for the window
    local opts = {
        relative = "editor",
        width = win_width,
        height = win_height,
        row = win_row,
        col = win_column
    }

    -- create a new window and run command
    local win = vim.api.nvim_open_win(buf, true, opts)
    vim.api.nvim_call_function("termopen", cmd)
    vim.api.nvim_command(":startinsert")
end
