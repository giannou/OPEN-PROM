Parameters
iCGI(allCy,YTIME)                            "Capital Goods Index (defined as CGI(Scenario)/CGI(Baseline))"
iNPDL(SBS)                                   "Number of Polynomial Distribution Lags (PDL)"
iFPDL(SBS,KPDL)                              "Polynomial Distribution Lags (PDL) Coefficients per subsector"
iResDemSub(allCy,SBS,YTIME)                  "Residuals in total energy demand per subsector (1)"
iLifChpPla(CHP)                              "Technical Lifetime for CHP plants (years)" /
$ondelim
$include "./iLifChpPla.csv"
$offdelim
/
iCo2EmiFac(allCy,SBS,EF,YTIME)               "CO2 emission factors per subsector (kgCO2/kgoe fuel burned)"
iUsfEnergy(allCy,SBS,EF,TEA,YTIME)           "Useful Energy Conversion Factor per subsector and technology (1)"
;


Equations
*** Power Generation
QElecDem(allCy,YTIME)         "Compute total electricity demand"
QElecConsAll(allCy,DSBS,YTIME)"Compute electricity consumption per final demand sector"

*** Transport
QMExtV(allCy,YTIME)            "Compute passenger cars market extension (GDP dependent)"
QMExtF(allCy,YTIME)            "Compute passenger cars market extension (GDP independent)"
QNumVeh(allCy,YTIME)           "Compute stock of passenger cars (in million vehicles)"
QNewReg(allCy,YTIME)           "Compute new registrations of passenger cars"
QTrnspActiv(allCy,TRANSE,YTIME)"Compute passenger transport acitivity"
QScrap(allCy,YTIME)            "Compute scrapped passenger cars"
QLevl(allCy,YTIME)             "Compute ratio of car ownership over saturation car ownership"
QScrRate(allCy,YTIME)          "Compute passenger cars scrapping rate"


***  INDUSTRY  - DOMESTIC - NON ENERGY USES - BUNKERS VARIABLES
QElecConsInd(allCy,YTIME)                 "Compute Consumption of electricity in industrial sectors"
QDemInd(allCy,YTIME)                      "Copmpute total final demand (of substitutable fuels) in industrial sectors"
QElecIndPrices(allCy,YTIME)               "Compute electricity industry prices"
QElecConsHeatPla(allCy, DSBS, YTIME)      "Compute electricity consumed in heatpump plants"
QFuelCons(allCy,DSBS,EF,YTIME)            "Compute fuel consumption"
QElecIndPricesEst(allCy, YTIME)           "Compute Electricity index - a function of industry price - Estimate"
QFuePriSubChp(allCy,DSBS,EF,TEA,YTIME)    "Compute fuel prices per subsector and fuel especially for chp plants"
QElecProdCosChp(allCy,DSBS,CHP,YTIME)     "Compute electricity production cost per CHP plant and demand sector"
*QTechCost(allCy,DSBS,Rcon,EF,TEA,YTIME)   "Compute technology cost (Keuro/toe)"
qDummyObj                                 "Define dummy objective function"
;


Variables
VElecDem(allCy,YTIME)          "Total electricity demand (TWh)"
VFeCons(allCy,EF,YTIME)        "Total final energy consumnption (Mtoe)"
VFNonEnCons(allCy,EFS,YTIME)   "Final non energy consumption (Mtoe)"
VLosses(allCy,EFS,YTIME)       "Distribution losses (Mtoe)"
VEnCons(allCy,EFS,YTIME)       "Final consumption in energy sector (Mtoe)"
VNetImp(allCy,EFS,YTIME)       "Net imports (Mtoe)"
VMExtV(allCy,YTIME)            "Passenger cars market extension (GDP dependent)"
VMExtF(allCy,YTIME)            "Passenger cars market extension (GDP independent)"
VLamda(allCy,YTIME)            "Ratio of car ownership over saturation car ownership (1)"
VNumVeh(allCy,YTIME)           "Stock of passenger cars (million vehicles)"
VNewReg(allCy,YTIME)           "Passenger cars new registrations (million vehicles)"
VScrap(allCy,YTIME)            "Scrapped passenger cars (million vehicles)"
VTrnspActiv(allCy,TRANSE,YTIME)"Passenger transport acitivity (1)"
                                !! - Activity for passenger cars is measured in (000)km
                                !! - Activity for all other passenger transportation modes is measured in Gpkm
VFuelPrice(allCy,DSBS,YTIME)   "Average fuel prices per subsector (kUS$2005/toe)"
VScrRate(allCy,YTIME)          "Scrapping rate of passenger cars (1)"
VElecConsAll(allCy,DSBS,YTIME) "Electricity demand per final sector (Mtoe)"
VConsFuel(allCy,DSBS,EF,YTIME) "Consumption of fuels in each demand subsector, excluding heat from heatpumps (Mtoe)"
VDemTr(allCy,TRANSE,EF,YTIME)  "Final energy demand in transport subsectors per fuel (Mtoe)"


***  INDUSTRY  - DOMESTIC - NON ENERGY USES - BUNKERS VARIABLES
VElecNonSub(allCy,DSBS,YTIME)          "Consumption of non-substituable electricity in Industry and Tertiary (Mtoe)"
VElecConsInd(allCy,YTIME)              "Total Consumption of Electricity in industrial sectors (Mtoe)"
VDemInd(allCy,YTIME)                   "Total final demand (of substitutable fuels) in industrial sectors (Mtoe)"
VDemSub(allCy,DSBS,YTIME)              "Total final demand (of substitutable fuels)per subsector (Mtoe)"
VElecIndPrices(allCy,YTIME)            "Electricity index - a function of industry price (1)"
VElecConsHeatPla(allCy, DSBS, YTIME)   "Electricity consumed in heatpump plants (Mtoe)"
VConsFuelSub(allCy,DSBS,EF,YTIME)      "Consumption of fuels in each demand subsector (including heat from heatpumps) (Mtoe)"
VElecIndPricesEst(allCy,YTIME)         "Electricity index - a function of industry price - Estimate (1)"
VResElecIndex(allCy,YTIME)             "Residual for electricity Index (1)"
VFuelPriceSub(allCy,SBS,EF,YTIME)      "Fuel prices per subsector and fuel (kUS$2005/toe)"
VFuePriSubChp(allCy,DSBS,EF,TEA,YTIME) "Fuel prices per subsector and fuel for CHP plants (kUS$2005/toe)"
VRenValue(YTIME)                       "Renewable value (Euro2005/KWh)"
VCosTech(allCy,SBS,EF,TEA,YTIME)       "Variable Cost of technology (Euro2005/toe-year)"
                                        !! - For transport is expressed in kEuro05 per vehicle
                                        !! - For Industrial sectors (except Iron and Steel) is expressed in Euro05/toe-year
                                        !! - For Iron and Steel is expressed in Euro05/tn-of-steel
                                        !! - For Domestic sectors is expressed in Euro05/toe-year
VElecProdCostChp(allCy,DSBS,CHP,YTIME)    "Electricity production cost per CHP plant and demand sector (Euro/KWh)"
VCarVal(allCy,NAP,YTIME)               "Carbon value for all countries (Euro2005/tn CO2)"
vDummyObj                              "Dummy maximisation variable (1)"
;


Scalars
sTWhToMtoe         "TWh to Mtoe conversion factor" /0.086/
sElecToSteRatioChp "Technical maximum of electricity to steam ratio in CHP plants" /1.15/
;
