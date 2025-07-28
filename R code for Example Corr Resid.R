# Install R package
library(devtools) 
install_github("rebeccakuiper/CTmeta")
# Load package
library(CTmeta)
# cite info:	
citation("CTmeta")

# Create input 
q <- 2
DeltaT <- 1
Phi_2 <- matrix(c(0.3540, -0.0482,
                  -0.0679, 0.2770), byrow = TRUE,
                nrow = q, ncol = q)
Gamma_2 <- matrix(c(1, -0.5155,
                    -0.5155, 1),
                  nrow = q, ncol = q)

# Make plots
ggPhiPlot(DeltaT, Phi_2, MaxMinPhi = TRUE)
SigmaVARPlot(DeltaT = 1, Phi = Phi_2, Gamma = Gamma_2)
ResidCorrMxPlot(DeltaT = 1, Phi = Phi_2, Gamma = Gamma_2)

# Determine DeltaT for which elements in Phi(DeltaT) are at its max
MaxPhi <- MaxDeltaT(DeltaT = 1, Phi = Phi_2)
MaxPhi$DeltaT_MinOrMaxPhi
MaxPhi$MinOrMaxPhi

# Calculate corresponding DT matrices, like the DT residual correlation matrix
standPhiEtc <- StandTransPhi(DeltaTStar = 1, Phi = Phi_2, Gamma = Gamma_2)
#standPhiEtc$SigmaVAR_DeltaTStar
standPhiEtc$ResidCorrMx_DeltaTStar # the off-diagonal is -0.4857512

# Determine DeltaT for which the DT residual covariance matrix is diagonal
DiagDeltaT_2 <- DiagDeltaT(Phi = Phi_2, Gamma = Gamma_2)
DiagDeltaT_2$DeltaT_diag # = 0. Hence, there is no positive DeltaT

# Calculate corresponding CT matrices, like the CT residual correlation matrix
CTMpar <- CTMparam(DeltaT = 1, Phi = Phi_2, Gamma = Gamma_2)
#CTMpar$Sigma
CTMpar$ResidCorrMx # the off-diagonal is -0.3904926

