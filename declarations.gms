Parameters
iCGI(allCy,YTIME)         "Capital Goods Index (defined as CGI(Scenario)/CGI(Baseline))"
iNPDL(SBS)                "Number of Polynomial Distribution Lags (PDL)"
iFPDL(SBS,KPDL)           "Polynomial Distribution Lags (PDL) Coefficients per subsector"
;

Equations
*** Power Generation
QElecDem(allCy,YTIME)     "Compute total electricity demand"

*** Transport
QMExtV(allCy,YTIME)       "Compute passenger cars market extension (GDP dependent)"
QMExtF(allCy,YTIME)       "Compute passenger cars market extension (GDP independent)"
QNumVeh(allCy,YTIME)      "Compute stock of passenger cars (in million vehicles)"
QNewReg(allCy,YTIME)      "Compute new registrations of passenger cars"
QTrnspActiv(allCy,TRANSE,YTIME)"Compute passenger transport acitivity"
QScrap(allCy,YTIME)       "Compute scrapped passenger cars"
QLevl(allCy,YTIME)        "Compute ratio of car ownership over saturation car ownership"

qDummyObj                 "Define dummy objective function"
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
VTrnspActiv(allCy,TRANSE,YTIME)"Passenger transport acitivity"
                                !! - Activity for passenger cars is measured in (000)km
                                !! - Activity for all other passenger transportation modes is measured in Gpkm
VFuelPrice(allCy,TRANSE,YTIME) "Average fuel prices per subsector (kUS$2005/toe)"
VScrRate(allCy,YTIME)          "Scrapping rate of passenger cars"
VLevl(allCy,YTIME)             "Ratio of car ownership over saturation car ownership"
vDummyObj                      "Dummy maximisation variable (1)"
;

Scalars
sTWhToMtoe   "TWh to Mtoe conversion factor" /0.086/
;