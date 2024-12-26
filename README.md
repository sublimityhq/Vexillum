# GameFlags

## Why?

FFlags (Feature Flags) are toggles that control whether certain features or code paths are active or inactive. Their purpose is to help developers separate code deployment from releases. This enables developers to:

- Gradually roll out new features to small groups of users without redeploying code.
- Perform A/B tests by activating different feature sets for different user segments.
- Quickly disable malfunctioning features to minimize disruptions in production environments.
- Deploy code more frequently since unready features can remain behind flags.

We recommend you to definitely look into using them if you want to reduce risk of new features having problems during deployments.

## Usage

GameFlags has a module script under the main module, named "Flags". Inside of the "Flags" module, there is a table to insert Flags into. Currently, there are two types of flags, "Unified" and "Platform". Unified will apply the flags to all platforms, while Platform lets you customize the value of the flags for specific platforms.
Example (Flags):

```luau
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
			Console = false
		}
	}
}
```

You can require the GameFlags module where you want to set a portion of code behind a flag:

```luau
local GameFlags = require(game:GetService("ReplicatedStorage").GameFlags)

if GameFlags:CheckFlag("FFlagTestUnified") then
	print("Hey, I'm flipped on!")
else
	print("Hey, I'm flipped off!")
end
```

## Future

GameFlags in the future will add a custom user interface to easily edit these flags, even in live places. There will also be a way to update flags on all clients, even in live servers.
