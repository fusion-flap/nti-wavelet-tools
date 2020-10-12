![NTIWT logo](documentation/logos/logo_long.png)

# nti-wavelet-tools
NTI Wavelet Tools is a data processing toolbox. Current development language is IDL (Interactive Data Language), but some features are only available for IDL 8.5 or later and Python 2.6. Old SVN repository and issue management site: https://deep.reak.bme.hu/projects/wavelet

# installation
For using NTI WT, you need FLAP. Code, documentation and guide:
https://github.com/fusion-flap/flap 

Clone the repository:
git clone https://github.com/fusion-flap/nti-wavelet-tools.git

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
