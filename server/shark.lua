-- Sharkatrons by ING

-- #####################################################################################

class 'Shark'

function Shark:__init()
	self.targets   = {}
	self.velocity  = 0
	self.reflect   = true
	
	self.current   = 0
	self.step      = 1
	
	local args     = {}
	args.position  = Vector3()
	args.angle     = Angle()
	args.model     = "sharkatron.3000.eez/go701-a.lod"
	args.collision = "sharkatron.3000.eez/go701_lod1-a_col.pfx"
	
	self.object    = StaticObject.Create(args)
end

function Shark:Update()
	local position = self.object:GetPosition()
	local distance = position - self.targets[self.current]
	self.object:SetAngle(Angle(-math.atan2(distance.z, distance.x) - (math.pi / 2), 0, 0))
	
	position   = position - (self.object:GetAngle() * Vector3.Forward) * self.velocity
	position.y = 198
	self.object:SetPosition(position)
	
	if distance:Length() < targetDistance then self:Select(self.current, false) end
end

function Shark:Select(index, place)
	local pos = self.targets[index]
	if place then self.object:SetPosition(pos) end
	
	index = index + self.step
	
	if index > #self.targets then
		index     = self.reflect and #self.targets - 1 or 1
		self.step = self.reflect and -1 or 1
	elseif index == 0 then
		index     = self.reflect and 2 or #self.reflect
		self.step = self.reflect and 1 or -1
	end
	
	self.current = index
end

function Shark:Parse(file)
	local file = io.open(file, "r")
	if file == nil then return false end
	
	local line, values
	local first = true
	for line in file:lines() do
		line   = line:gsub("\t", ""):gsub(" ", "")
		values = line:split(",")
		if first then
			self.velocity = tonumber(values[1])
			self.reflect  = values[2] == "true" and true or false
			first         = false
		else
			if #values < 3 then return false end
			table.insert(self.targets, Vector3(tonumber(values[1]), tonumber(values[2]), tonumber(values[3])))
		end
	end
	
	if #self.targets < 2 then return false end
	
	self:Select(1, true)
	return true
end
