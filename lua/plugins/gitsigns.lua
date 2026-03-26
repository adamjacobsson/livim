return {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {
        current_line_blame = false,
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            local function map(mode, lhs, rhs, desc)
                vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
            end

            map("n", "]h", gs.next_hunk, "Next Git Hunk")
            map("n", "[h", gs.prev_hunk, "Previous Git Hunk")
        end,
    },
    keys = {
        {
            "<leader>gd",
            function()
                require("gitsigns").diffthis()
            end,
            desc = "Git Diff Buffer",
        },
        {
            "<leader>gD",
            function()
                require("gitsigns").diffthis("~")
            end,
            desc = "Git Diff Against HEAD~",
        },
        {
            "<leader>gp",
            function()
                require("gitsigns").preview_hunk()
            end,
            desc = "Git Preview Hunk",
        },
        {
            "<leader>gb",
            function()
                require("gitsigns").blame_line({ full = true })
            end,
            desc = "Git Blame Line",
        },
        {
            "<leader>gr",
            function()
                require("gitsigns").reset_hunk()
            end,
            desc = "Git Reset Hunk",
        },
        {
            "<leader>gR",
            function()
                require("gitsigns").reset_buffer()
            end,
            desc = "Git Reset Buffer",
        },
        {
            "<leader>gs",
            function()
                require("gitsigns").stage_hunk()
            end,
            desc = "Git Stage Hunk",
        },
        {
            "<leader>gu",
            function()
                require("gitsigns").undo_stage_hunk()
            end,
            desc = "Git Undo Stage Hunk",
        },
        {
            "<leader>gq",
            function()
                vim.cmd("diffoff!")
                if vim.fn.winnr("$") > 1 then
                    vim.cmd("only")
                end
            end,
            desc = "Quit Git Diff",
        },
        {
            "<leader>gQ",
            function()
                require("gitsigns").setqflist("all")
            end,
            desc = "Git Hunks To Quickfix",
        },
    },
}
