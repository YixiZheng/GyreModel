# GyreModel
Adapted MITgcm code and MATLAB code for generating wind forcing used in our gyre-model paper

This folder provide adapted MITgcm code and wind forcings for running the experiments mentioned in our paper "Reversal of ocean gyres near ice shelves in the Amundsen Sea caused by the interaction of sea ice and wind"

The model code is adapted from MITgcm tutorial: 4.1. Barotropic Ocean Gyre, https://mitgcm.readthedocs.io/en/latest/examples/barotropic_gyre/barotropic_gyre.html 

This folder has five subfolders:
four folders contains all experiments for different angels of ice edges
  exp_ada_Weaktopright: Seaice 5pi/8
  exp_ada_Weaktopleft: Seaice 3pi/8
  exp_ada_Topright: Seaice 3pi/4
  exp_ada_Topleft: Seaice pi/4
  exp_ada_Flat: Seaice pi/2
one folder contains all experiments for Discussion
  exp_Discussion: experiments mentioned in Discussion (MIZ model, 1.5-layer baroclinic model, model with a rectangular domain, gyre spin-up time tests)

Inside of those subfolders, there're folders containning the experiments with different tau transferred to the ocean (denoted by the number in the end of the folders) and the original wind forcing without sea ice.
