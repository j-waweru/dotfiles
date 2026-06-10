return {
{
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
        heading = {
            enabled = true,
            backgrounds = {
                "none",
                "none",
                "none",
                "none",
                "none",
                "none",
            },
        },

        code = {
            enabled = true,
            highlight = "none",
            border = "none",
        },

        bullet = {
            enabled = false,
        },

        pipe_table = {
            enabled = false,
        },

        anti_conceal = {
            enabled = false,
        },

        sign = {
            enabled = false,
        },
    },
},

    -- MARKDOWN PREVIEW
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        ft = "markdown",

        keys = {
            {
                "<leader>mp",
                "<cmd>MarkdownPreviewToggle<cr>",
                mode = "n",
                desc = "Markdown Preview",
            },
        },
    },

}
