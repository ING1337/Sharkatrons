-- Sharkatrons by ING

-- #####################################################################################

updatesPerSecond = 20  -- defines how often the server updates the shark positions
targetDistance   = 2   -- the distance (in meter) a shark has to reach a waypoint, to select the next one

-- #####################################################################################

aquarium = Aquarium()

aquarium:NewShark("airport_racetrack.txt")
aquarium:NewShark("city1.txt")
aquarium:NewShark("city2.txt")
aquarium:NewShark("docks.txt")
aquarium:NewShark("financial_district1.txt")
aquarium:NewShark("financial_district2.txt")
aquarium:NewShark("lost.txt")
aquarium:NewShark("mhc1.txt")
aquarium:NewShark("mhc2.txt")
aquarium:NewShark("original_easteregg.txt")
aquarium:NewShark("racetrack.txt")
aquarium:NewShark("skull_inside.txt")
aquarium:NewShark("skull_outside.txt")
