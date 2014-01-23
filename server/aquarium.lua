-- Sharkatrons by ING

-- #####################################################################################

class 'Aquarium'

function Aquarium:__init()
	self.sharks         = {}
	self.timer          = Timer()
	self.time           = 0
	self.lastRenderTime = 0
	subRender           = Events:Subscribe("PreTick", self, self.Ticker)
end

function Aquarium:Ticker()
	self.time = self.timer:GetMilliseconds() - self.lastRenderTime
	if self.time < 1000 / updatesPerSecond then return end
	
	local i = 1
	while i <= #self.sharks do
		self.sharks[i]:Update()
		i = i + 1
	end
end

function Aquarium:NewShark(file)
	local shark  = Shark()
	local result = shark:Parse(file)
	if result then 
		table.insert(self.sharks, shark)
		--print("shark " .. file .. " - " .. " loaded")
	else
		print(file .. " is not a valid shark file!")
	end
end