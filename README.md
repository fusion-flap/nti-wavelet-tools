![NTIWT logo](documentation/logos/logo_long_small.png)

# nti-wavelet-tools
NTI Wavelet Tools is a data processing toolbox. Current development language is IDL (Interactive Data Language), but some features are only available for IDL 8.5 or later and Python 3.6. Old SVN repository and issue management site: https://deep.reak.bme.hu/projects/wavelet

# installation
For using NTI WT, you need FLAP. Code access: https://github.com/fusion-flap/flap 

Follow instructions at: https://github.com/fusion-flap/flap/blob/master/docs/FLAP_install_guide.pdf

Clone the repository:

git clone https://github.com/fusion-flap/nti-wavelet-tools.git

Detailed instructions in the wiki: https://github.com/fusion-flap/nti-wavelet-tools/wiki

# branches
swich between branches (different versions) with:

git checkout ...
for example: git checkout <branch name>

In default, you start on the master branch, which is our latest released version.

you can list all available branches with:

git branch -a

# updating
To keep your copy up to date, it is recommended to update your repository frequently, using:

git pull

Updates are less frequent on the development branch (one per a few months), and rarest on the master branch.
They are more frequent on other, task-focused branches, some can have several commits per hour.

# GUI
For using the GUI, run python/gui/main.py



# References

### General
G. I. Pokol et al., Continuous linear time-frequency transforms in the analysis of fusion plasma transients. 40th EPS Conference on Plasma Physics (2013) Paper: 5.116

G. I. Pokol et al., A wavelet based method for detecting transient plasma waves and determining their spatial structure, 37th EPS Conference on Plasma Physics (2010) Paper: P5.129

### Bicoherence
Peter, Zsolt Poloskei et al., Bicoherence analysis of nonstationary and nonlinear processes. ARXIV PREPRINT 1811 Paper: arXiv:1811.02973 (2018)

P. Zs. Poloskei et al. Bicoherence analysis of fast ion driven transient plasma waves European Physical Society (EPS) (2017) Paper: P5.179 , 4 p.

### Amplitude estimation
Horváth, L et al., Experimental investigation of the radial structure of energetic particle driven modes
NUCLEAR FUSION 56 : 11 Paper: 112003 , 14 p. (2016)

L, Horváth et al., Fast changes in the mode structure of chirping energetic particle driven modes, 42nd EPS Conference on Plasma Physics (2015) Paper: P1.148 , 1 p.

Sertoli, M et al., Characterization of saturated MHD instabilities through 2D electron temperature profile reconstruction from 1D ECE measurements, NUCLEAR FUSION 53 : 5 Paper: 053015 , 14 p. (2013)

G., Papp et al., Analysis of sawtooth precursor activity in ASDEX Upgrade using bandpower correlation method, 36th EPS Conference on Plasma Physics, (2009) Paper: P1.157

Szepesi et al., Investigation of pellet-driven magnetic perturbations in different tokamak scenarios, PLASMA PHYSICS AND CONTROLLED FUSION 51 : 12 Paper: 125002 , 19 p. (2009)

Pokol, G et al., Application of a bandpower correlation method to the statistical analysis of MHD bursts in quiescent Wendelstein-7 AS stellarator plasmas, PLASMA PHYSICS AND CONTROLLED FUSION 49 : 9 pp. 1391-1408. , 18 p. (2007)

G., Pokol et al., Statistical analysis of experimentally observed transient MHD modes, 30th EPS Conference on Controlled Fusion and Plasma Physics, (2003) Paper: P-3.7


### Mode number
Kocsis, G et al., Reliability study of pellet ELM pace making, 42nd EPS Conference on Plasma Physics (2015) Paper: P4.171 , 4 p.

Szepesi, T et al., Pellet-induced MHD activity in H-mode plasmas at ASDEX Upgrade, 40th EPS Conference on Plasma Physics (2013) Paper: P5.154

Pokol, G et al., Experimental study and simulation of W7-AS transient MHD modes, AIP CONFERENCE PROCEEDINGS 993 : 1 pp. 215-218. , 4 p. (2008)

Horváth, L. et al., (2015). Reducing systematic errors in time-frequency resolved mode number analysis. Plasma Physics and Controlled Fusion, 57(12), 125005. doi:10.1088/0741-3335/57/12/125005

G. I. Pokol, et al. A wavelet based method for detecting transient plasma waves and determining their spatial structure. European Physical Society (EPS) (2010) Paper: P5.129


### Further related publications:
M. Hoppe et al., Spatiotemporal analysis of the runaway distribution function from synchrotron images in an ASDEX Upgrade disruption, arXiv.org Paper: arXiv:2005.14593 , 23 p. (2021)

PH., LAUBER et al., Strongly non-linear energetic particle dynamics in ASDEX Upgrade scenarios with core impurity accumulation, In: 27th IAEA Fusion Energy Conference - IAEA CN-258 (2018) Paper: EX/1-1 , 8 p.

M, García-Muñoz et al., Fast-ion redistribution and loss due to edge perturbations in the ASDEX Upgrade, DIII-D and KSTAR tokamaks; IAEA Fusion energy conference (2012) pp. 1-4. , 4 p.

G. Papp et al., Sawtooth precursors in ASDEX Upgrade, 38th EPS Conference on Plasma Physics (2011) Paper: 4.093

G. Papp et al., Low frequency sawtooth precursor activity in ASDEX Upgrade PLASMA PHYSICS AND CONTROLLED FUSION 53 : 6 Paper: 065007 , 17 p. (2011)

P. Gábor et al., Low frequency sawtooth precursor in ASDEX Upgrade. Proceedings of the 5th IAEA Technical Meeting on Theory of Plasma Instabilities (IAEA-TM-40758) (2011) Paper: B4.1

V. Igochine et al., The role of stochastization in fast MHD phenomena on ASDEX Upgrade, Proceedings of the 22nd IAEA Fusion Energy Conference (2008) Paper: EX/P9-10

Belonohy, E et al., Systematic Density Fluctuation Study on W7-AS, Proceedings of the 34th EPS Conference on Plasma Physics (2007) Paper: P2.046

G. Pokol, G. Por, The Advanced Loose Parts Monitoring System (ALPS) and wavelet analysis, INTERNATIONAL JOURNAL OF NUCLEAR ENERGY SCIENCE AND TECHNOLOGY 2 : 3 pp. 241-252. , 12 p. (2006)

G. Papp et al., Analysis of transient MHD modes of Wendelstein 7-AS by coherence techniques, 32nd European Physical Society Conference on Plasma Physics and Controlled Fusion combined with the 8th International Workshop on Fast Ignition of Fusion Targets (2005) Paper: Paper P-5.021.

Pokol, G et al., Amplitude correlation analysis of W7-AS Mirnov-coil array data and other transport relevant diagnostics, Proceedings of the 20th IAEA Fusion Energy Conference: IAEA Conference & Symposium Papers (2005) Paper: PS-EX/P6-22

Zoletnik, S et al., Anomalous transport events in the core plasma of the Wendelstein 7-AS stellarator, 32nd European Physical Society Conference on Plasma Physics and Controlled Fusion combined with the 8th International Workshop on Fast Ignition of Fusion Targets (2005) Paper: P-5.023


### Hungarian
Horváth, László et al., Korszerű idő-frekvencia analízis programcsomag tranziens folyamatok vizsgálatára, NUKLEON 5 Paper: 111 , 6 p. (2012)

G., Papp et al., Fűrészfog-oszcillációk vizsgálata az ASDEX-Upgrade tokamakon, NUKLEON 2 : 3 Paper: 41 , 5 p. (2009)

G. Pokol, Tranziens hullámok fúziós plazmákban, NUKLEON 1 Paper: 01 , 6 p. (2008)

G. Pokol et al., Transzport-releváns fluktuációk mérése a Wendelstein 7-AS fúziós berendezésen, FIZIKAI SZEMLE 55 : 4 p. 126 (2005)

Lazányi, N et al., Alacsony frekvenciás fűrészfog prekurzor vizsgálata az ASDEX Upgrade tokamakon, NUKLEON 5 Paper: 101 , 5 p. (2012)