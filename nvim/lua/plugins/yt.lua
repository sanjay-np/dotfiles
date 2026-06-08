return {
	{
		"sanjay-np/nvim-yt-player",
		config = function()
			require("yt-player").setup({
				statusline = {
					enabled = true,
					format = "{icon} {title} - {progress} [{position}/{duration}]",
					icon_playing = "▶",
					icon_paused = "⏸",
					truncate_title = 25,
					progress_width = 10,
				},
				search = {
					limit = 40,
				},
				player = {
					queue_display_limit = 20,
				},
			})
		end,
	},
}
