# Optimizing-of-production-schedule-using-R
Created a data using following code for finding a optimal schedule using R
The unit product cost in any period is $6 during regular time and $9 during overtime. Holding cost per unit per quarter is $0.10. To ensure that the model has a feasible solution when no shortage is allowed, the cumulative supply up to any quarter must be equal at least to the associated cumulative demand.
The demand vector is uncertain. And you have a worst-case and best-case scenario. You should assume a surplus of 20 no matter the uncertainty in the demand. 
Set.seed(random 4 digit number)
 P  <- round(20*runif(4,0,1)) #demand uncertainty perturbation #modified to avoid computational problems.
D0 <- c(100,190,210,160) # average prediction
D_BC <-D0+P #best case scenario
D_WC<-D0-P #worst case scenario
