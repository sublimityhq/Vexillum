-- Create flags here.
return {
	FFlagTestUnified = {
		Type = "Unified",
		Value = true
	},
	FFlagTestPlatform = {
		Type = "Platform",
		Value = {
			Desktop = true,
			Mobile = false,
			Console = false,
		},
	},
}