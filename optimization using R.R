#Pushvanth teja Malisetty

# Importing lpSolve package
library(lpSolve)

# Set production costs matrix
costs <- matrix(c(6, 6.1, 6.2, 6.3, 0,
                  9, 9.1, 9.2, 9.3, 0,
                  10, 6, 6.1, 6.2, 0,
                  10, 9, 9.1, 9.2, 0,
                  10, 10, 6, 6.1, 0,
                  10, 10, 9, 9.1, 0,
                  10, 10, 10, 6, 0,
                  10, 10, 10, 9, 0), nrow = 8, byrow = TRUE)

# Set customers and production type names
colnames(costs) <- c("Spring", "Summer", "Fall", "Winter", "Surplus")
rownames(costs) <- c("R1", "O1", "R2", "O2", "R3", "03", "R4", "04")

D0 <- c(100,190,210,160) # average prediction of demand in respective quaters

# Set unequality/equality signs for production types
row.signs <- rep("<=", 8)

# Set right hand side coefficients for production types
row.rhs <- c(90, 50, 100, 60, 120, 80, 110, 70)

# Set unequality/equality signs for demand
col.signs <- rep(">=", 5)

# Set right hand side coefficients for best case demand adding surplus 20 
col.rhs <- append(D0,20)

avg <-lp.transport(costs, "min", row.signs, row.rhs, col.signs, col.rhs)
# Final value for average case scenario
lp.transport(costs, "min", row.signs, row.rhs, col.signs, col.rhs)$solution

avg$objval # cost of the avg case scenario for the given parameters.

set.seed(8501)
P  <- round(20*runif(4,0,1)) #demand uncertainty perturbation 
#modified to avoid computational problems.

#Demand for best case scenario

D_BC <- D0 + P #best case scenario

# Set right hand side coefficients for best case demand adding surplus 20 
col.rhs_BC <- append(D_BC,20)


BC <-lp.transport(costs, "min", row.signs, row.rhs, col.signs, col.rhs_BC)
# Final value for best case scenario
lp.transport(costs, "min", row.signs, row.rhs, col.signs, col.rhs_BC)$solution

BC$objval # cost of the best case scenario for the given parameters.


#Demand for worst case scenario

D_WC <- D0 - P #worst case scenario

# Set right hand side coefficients for worst case demand adding surplus 20 
col.rhs_WC <- append(D_WC,20)

WC <-lp.transport(costs, "min", row.signs, row.rhs, col.signs, col.rhs_WC)
# Final value for best case scenario
lp.transport(costs, "min", row.signs, row.rhs, col.signs, col.rhs_WC)$solution
# Final value (z)

WC$objval # Cost of the worst case scenario for the given parameters


 
# Setting the demand to new precise estimates
P1 <- round(10*runif(4,0,1))

#Demand for best case scenario

D_BC2 <- D0 + P1 #best case scenario

# Set unequality/equality signs for production types
row.signs <- rep("<=", 8)

# Set right hand side coefficients for production types
row.rhs <- c(90, 50, 100, 60, 120, 80, 110, 70)

# Set unequality/equality signs for demand
col.signs <- rep(">=", 5)


# Set right hand side coefficients for best case demand adding surplus 20 
col.rhs_BC2 <- append(D_BC2,20)


BC2 <-lp.transport(costs, "min", row.signs, row.rhs, col.signs, col.rhs_BC2)
# Final value for best case scenario
lp.transport(costs, "min", row.signs, row.rhs, col.signs, col.rhs_BC2)$solution

BC2$objval # cost of the best case scenario for the given parameters.


#Demand for worst case scenario

D_WC2 <- D0 - P1 #worst case scenario

# Set right hand side coefficients for worst case demand adding surplus 20 
col.rhs_WC2 <- append(D_WC2,20)

WC2 <-lp.transport(costs, "min", row.signs, row.rhs, col.signs, col.rhs_WC2)
# Final value for best case scenario
lp.transport(costs, "min", row.signs, row.rhs, col.signs, col.rhs_WC2)$solution
# Final value (z)

WC2$objval # Cost of the worst case scenario for the given parameters

