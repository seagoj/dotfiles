return {
	pack = function (packages)
		local add_cmd = nil
		if ('table' == type(packages)) then
			for _, package in ipairs(packages) do
				if (nil == add_cmd) then
					add_cmd = 'packadd! ' .. package
				else
					add_cmd = add_cmd .. ' | packadd! '.. package	
				end
			end
		else
			add_cmd = 'packadd! ' .. packages
		end

		vim.cmd(add_cmd)
	end
}
