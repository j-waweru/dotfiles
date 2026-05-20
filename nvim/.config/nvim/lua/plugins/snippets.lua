return {
	-- Snippet Engine
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		-- Build step for regex support
		build = "make install_jsregexp",
	},
	-- VSCode-style snippet collection
	{ "rafamadriz/friendly-snippets" },

	-- Integration with nvim-cmp
	{ "saadparwaiz1/cmp_luasnip" },
}
