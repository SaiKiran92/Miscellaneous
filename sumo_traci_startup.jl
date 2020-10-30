using PyCall

# telling PyCall to look for modules in 'tools' folder.
tools = try
			joinpath(ENV["SUMO_HOME"], "tools")
		catch
			@error "Please declare the environmental variable 'SUMO_HOME'."
		end
pushfirst!(PyVector(pyimport("sys")."path"), tools)

# importing modules
traci = pyimport("traci")
checkBinary = pyimport("sumolib")."checkBinary"
