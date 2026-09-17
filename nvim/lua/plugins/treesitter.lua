return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local ensure = {
			"lua", "vim", "vimdoc", "html", "css", "svelte",
			"typescript", "java", "python", "rust",
			"markdown", "markdown_inline", "cpp",
		}
		require("nvim-treesitter").install(ensure)
		vim.api.nvim_create_autocmd("FileType", {
			pattern = ensure,
			callback = function(ev)
				pcall(vim.treesitter.start, ev.buf)
			end,
		})
	end,
}
