
#library(devtools)
#install_github("rebeccakuiper/CTmeta")
library(CTmeta)
#citation("CTmeta")
#?SigmaVARPlot
#?DiagDeltaT


#3variate 
q <- 3
DeltaT <- 1
Phi_3 <- matrix(c(0.52, 0.22, 0.41,
                  0.11, 0.63, 0.41,
                  0.00, 0.00, 0.45), byrow = TRUE,
nrow = q, ncol = q)
SigmaVAR_3 <- diag(q)
Phi_3
SigmaVAR_3
#
SigmaVARPlot(DeltaT, Phi_3, SigmaVAR_3)
ResidCorrMxPlot(DeltaT, Phi_3, SigmaVAR_3)
#
SigmaVARPlot(DeltaT, Phi_3, SigmaVAR_3, Diag = TRUE)
ResidCorrMxPlot(DeltaT, Phi_3, SigmaVAR_3, Diag = TRUE)
ggPhiPlot(DeltaT, Phi_3, MaxMinPhi = TRUE)

# Calculate corresponding CT matrices, like CT residual correlation matrix
CTMpar <- CTMparam(DeltaT = 1, Phi = Phi_3, SigmaVAR = SigmaVAR_3)
#CTMpar$Sigma # All negative
CTMpar$ResidCorrMx # All off-diagonals negative
CTMpar$standGamma # All off-diagonals positive
# Hence, the residual correlations have to cross 0....



#2variate 
#library(CTmeta)
q <- 2
DeltaT <- 1
Phi_2 <- matrix(c(0.5543025, 0.2547274,
                  0.1477329, 0.6612970), byrow = TRUE,
                nrow = q, ncol = q)
SigmaVAR_2 <- matrix(c(1.1990749, 0.1990749,
                       0.1990749, 1.1990749),
                nrow = q, ncol = q)
SigmaVAR_2diag <- diag(q)
Phi_2
SigmaVAR_2
#
DiagDeltaT_2 <- DiagDeltaT(Phi_2, SigmaVAR_2)
#DiagDeltaT_2
DiagDeltaT_2$DeltaT_diag # gives: 0.3564514
#
SigmaVARPlot(DeltaT, Phi_2, SigmaVAR_2)
#SigmaVARPlot(DeltaT, Phi_2, SigmaVAR_2, Min = 0, Max = 1)
#
SigmaVARPlot(DeltaT, Phi_2, SigmaVAR_2, Diag = TRUE)
ResidCorrMxPlot(DeltaT, Phi_2, SigmaVAR_2, Diag = TRUE)
ggPhiPlot(DeltaT, Phi_2, MaxMinPhi = TRUE)

#SigmaVARPlot(DeltaT, Phi_2, SigmaVAR_2, Min = 0, Max = 2, Diag = TRUE)
#ResidCorrMxPlot(DeltaT, Phi_2, SigmaVAR_2, Min = 0, Max = 1, Diag = TRUE)

# Calculate corresponding CT matrices, like CT residual correlation matrix
CTMpar <- CTMparam(DeltaT = 1, Phi = Phi_2, SigmaVAR = SigmaVAR_2)
#CTMpar$Sigma # off-diagonal negative
CTMpar$ResidCorrMx # off-diagonal negative
CTMpar$standGamma # off-diagonal positive
# Hence, the residual correlation has to cross 0....



# De Haan Example
#
#library(CTmeta)
q <- 2
DeltaT <- 1
Phi_2 <- matrix(c(0.3540, -0.0482,
                  -0.0679, 0.2770), byrow = TRUE,
                nrow = q, ncol = q)
Gamma_2 <- matrix(c(1, -0.5155,
                    -0.5155, 1),
                  nrow = q, ncol = q)
Phi_2
Gamma_2
#
#
# Make plots
ggPhiPlot(DeltaT, Phi_2, MaxMinPhi = TRUE)
SigmaVARPlot(DeltaT = 1, Phi = Phi_2, Gamma = Gamma_2)
ResidCorrMxPlot(DeltaT = 1, Phi = Phi_2, Gamma = Gamma_2)
#
# Determine DeltaT for which elements in Phi(DeltaT) are at its max
MaxPhi <- MaxDeltaT(DeltaT = 1, Phi = Phi_2)
MaxPhi$DeltaT_MinOrMaxPhi
MaxPhi$MinOrMaxPhi
#
# Calculate corresponding DT matrices, like DT residual correlation matrix
standPhiEtc <- StandTransPhi(DeltaTStar = 1, Phi = Phi_2, Gamma = Gamma_2)
#standPhiEtc
#SigmaVAR_2 <- standPhiEtc$SigmaVAR_DeltaTStar
#SigmaVAR_2
standPhiEtc$ResidCorrMx_DeltaTStar # the off-diagonal is -0.4857512
#
# Determine DeltaT for which DT residual covariance matrix is diagonal
DiagDeltaT_2 <- DiagDeltaT(Phi = Phi_2, Gamma = Gamma_2)
#DiagDeltaT_2
DiagDeltaT_2$DeltaT_diag # = 0. Hence, there is no positive DeltaT
#
# Calculate corresponding CT matrices, like CT residual correlation matrix
CTMpar <- CTMparam(DeltaT = 1, Phi = Phi_2, Gamma = Gamma_2)
CTMpar$Sigma
CTMpar$ResidCorrMx # the off-diagonal is -0.3904926

# Calculate corresponding CT matrices, like CT residual correlation matrix
CTMpar <- CTMparam(DeltaT = 1, Phi = Phi_2, SigmaVAR = SigmaVAR_2)
#CTMpar$Sigma # off-diagonal positive
CTMpar$ResidCorrMx # off-diagonal positive
CTMpar$standGamma # off-diagonal positive
# Hence, the residual correlation does not have to cross 0....

