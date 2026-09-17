-- Mason LSP
return {
		"mason-org/mason-lspconfig.nvim",
		opts = {
			-- automatic_enable turns on every mason-installed server. pylsp and ty
			-- both attach to python buffers alongside pyright: pylsp floods
			-- pycodestyle noise, and ty tries to parse jupytext .ipynb buffers as
			-- notebook JSON and errors out. Keep pyright as the only python server.
			automatic_enable = {
				exclude = { "pylsp", "ty" },
			},
		},
		dependencies = { { "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	}
}
