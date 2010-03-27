
myfunctions = LibStub("AceAddon-3.0"):NewAddon("myfunctions", "AceConsole-3.0","AceEvent-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("myfunctions",true)

local defaults = {
    profile =  {
        loottable = {},
		dummy = ""
    },
}


local options = {
    name = "mykugeln",
    handler = mykugeln,
    type = 'group',
    args = {
       cmds = {
		type = "group",
		name = "ueber", -- L["About"],
		cmdInline = true,
		order = 1,

		args = {
			info = {
				order = 1,
				type = "execute",
				name = "info ",
				desc = "description zeugs",
				func = "Info",
				guiHidden = true,
				},

			show = {
				order = 1,
				type = "execute",
				name = "check ",
				desc = "show jointimes",
				func = "Show",
				guiHidden = true,
				},

			save = {
				order = 1,
				type = "execute",
				name = "check ",
				desc = "show jointimes",
				func = "save",
				guiHidden = true,
				},
			test = {
				order = 1,
				type = "execute",
				name = "check ",
				desc = "show jointimes",
				func = "test",
				guiHidden = true,
				},

						test2 = {
				order = 1,
				type = "execute",
				name = "check ",
				desc = "show jointimes",
				func = "test2",
				guiHidden = true,
				},

			add = {
				type = "input",
				name = "Message",
				desc = "add user to blacklist",
				usage = "<Your message>",
				get = "GetMessage",
				set = "AddTest",
			},



			}, -- args
		}, -- cmds



	} -- args

} -- options



---------------------------------------------------------------------------

--
--
function myfunctions:OnInitialize()

	--self.db = LibStub("AceDB-3.0"):New("myfunctionsDB")
	LibStub("AceConfig-3.0"):RegisterOptionsTable("myfunctions", options)
    self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("myfunctions", "myfunctions")
    self:RegisterChatCommand("myfunctions", "ChatCommand")
    self:RegisterChatCommand("functions", "ChatCommand")

end



function myfunctions:ChatCommand(input)
    if not input or input:trim() == "" then
 		self:Print("BUHJAKA!!!")


		self.f = cFunctions.create()
		self.f:dummy()
    else
        LibStub("AceConfigCmd-3.0").HandleCommand(myfunctions, "f", "myfunctions", input)
    end
end






-- Called when the addon is enabled
function myfunctions:OnEnable()
	self:Print("loaded ... und nutzbar")
	self.f = cFunctions.create()
end


function myfunctions:OnDisable()
    -- Called when the addon is disabled
end


