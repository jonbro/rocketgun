-- should build an actionscript file that defines all of the level datas

local lr = io.open("LevelsRegistry.as", "w")
-- write the preamble
lr:write([[
	package  
{
	/**
	 * Level Registry
	 */

	public class LevelsRegistry 
	{
		//	Levels
]]);
local dir = io.popen('ls data/levels/')
local levelNames = {}
for line in dir:lines() do
	-- check to make sure that this is a level
	if line:sub(-3) == 'oel' then
		local lName = line:sub(1, -5)
		table.insert(levelNames, lName)
		lr:write("\t\t");
		lr:write([[[Embed(source = 'data/levels/]]);
		lr:write(line);
		lr:write([[', mimeType = 'application/octet-stream')] public static var ]] .. lName .. [[:Class;]]);
		lr:write("\n");
	end
end

-- write the postamble
lr:write([[
		public function AssetsRegistry() 
		{
		}
		public static function GetLevels():Object{
			return {]]);

for i,v in ipairs(levelNames) do
	lr:write("'" .. v .. "':" .. v .. ",")
end

lr:write([[			};
		}
	}

}]]);