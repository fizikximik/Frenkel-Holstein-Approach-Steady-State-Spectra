%clear
%Start of parameters
au2cminverse =  219474.6305;
au2ev = 27.211325;
cm2ev = au2ev/au2cminverse;

%JN parameters============================================================================
N=3;
T=290;

%vibrational
freqratio=1; %es/gs
%freqratio=1479/1100;
w_0=1;
w_1=freqratio*w_0;
L=sqrt(1/1.67); %chlbenz abs
%L=sqrt(0.90); %works with J=-0.0005;
%L=1;
w_00=0;
w_00=w_00 + 0.5*(w_1-w_0);
w_D=3*w_0;
v_max=10;
tpcheck=1;
v_ground=max(v_max,12);
%modefreq=0.17; %eV, Spano default
gsmode=1100*cm2ev;
kb=8.617333262e-5/gsmode ; 


%electronic
PBC=1; %0 means open bound cond,1 means pbc 
tdm_0=1;

%J0=-0.29; %from the A1/A2 ratio in the absorption spectrum in chlbenz
J0=-0.12; %fitted for chlbenz agg abs
%J0=-0.0005;

J1=0.20;
twoJ=0; %1D Hamiltonian with 3 types of coupling, 0=do not use, 1=use
sigma=0.3*w_0; %disorder parameter
sigma=0;
if sigma>0
 ncon=10000;
else
 ncon=1;
end
l_0 = 0;% Dimensionless correlation length 0-all sites are independent. 1/0 - all sites have same shift in energy from w_00


%spectrum calculation
broadtype=0; %0-Gaussian, 1-Lorentzian
broad_par=0.48*w_0;
%broad_par=0.3*w_0;

%plots and outputs
%modefreq=1479.0*cm2ev; %for abs
%modefreq=1100.0*cm2ev; %for emi
modefreq=1420*cm2ev; %fitted for chlbenz abs
w00=12935.2; %in cm-1
%broad_par*modefreq

%threshold for choosing populations in emission
boltzmannthresh = 1e-6; %This is the lowest Boltzmann factor up to which you want to include contribution of eigenstates; 10^-6 is good; 1e-4 or 1e-5 can be used for faster calculation
threshold = -kb * T * log(boltzmannthresh)/w_0; %energy threshold on the eigenstates that will be considered for Boltzmann average. Don't change the formula
