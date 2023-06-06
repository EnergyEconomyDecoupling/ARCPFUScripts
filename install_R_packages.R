# This script installs R packages and is called
# by prep_R_software_on_arc.sh.

print("Installing R packages")

install.packages(c("stringi", 
                   "targets"),
                   repos = "https://www.stats.bris.ac.uk/R/")

library(devtools)

update.packages(ask = FALSE, 
	            repos = "https://www.stats.bris.ac.uk/R/")

devtools::install_github(c("MatthewHeun/MKHthemes",  
                           "MatthewHeun/RCLabels",
                           "MatthewHeun/matsbyname", 
                           "MatthewHeun/matsindf", 
                           "MatthewHeun/IEATools", 
                           "MatthewHeun/Recca", 
					       "MatthewHeun/MKHthemes",  
					       "EnergyEconomyDecoupling/MWTools", 
                           "EnergyEconomyDecoupling/PFUPipelineTools",
					       "EnergyEconomyDecoupling/PFUSetup", 
                           "EnergyEconomyDecoupling/PFUDatabase", 
                           "EnergyEconomyDecoupling/PFUAggDatabase"))
							   
print("Completed installing R packages")