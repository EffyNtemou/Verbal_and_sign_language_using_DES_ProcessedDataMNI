# Dataset and Coordinate Transformation Code

This repository accompanies the publication:

**Sukunda et al. (in press)**  
*Mapping the neural substrates of verbal and sign language: A single-case study using direct electrical stimulation*

The repository contains:
1. A dataset of stimulation sites and associated behavioral effects (main branch).
2. A MATLAB function for transforming native-space coordinates to MNI space using SPM (branch: `Coordinate_transformation`).

---

## Repository Structure

- **`main` branch**  
  Contains the dataset reported in the paper, including MNI coordinates, error types, and task information for all stimulation sites.

- **`Coordinate_transformation` branch**  
  Contains MATLAB code used to transform native-space coordinates into MNI space using inverse deformation fields generated with SPM.

---

## Dataset Description (main branch)

### Table Overview

The dataset provides point-wise information for all stimulation sites described in the paper. Each row corresponds to a single stimulation point.

### Columns

- **Point_number**  
  Unique identifier for each stimulation point, corresponding to the point numbers reported in the manuscript.

- **X_MNI, Y_MNI, Z_MNI**  
  MNI (Montreal Neurological Institute 152) coordinates of the stimulation site, reported in millimeters.

- **Error**  
  Type of error induced by stimulation at the corresponding site, as categorized in the paper.

- **Task**  
  Behavioral or language task during which the stimulation was applied.

### Notes

- Coordinates are reported in MNI152 space to facilitate comparison with other neuroimaging studies.
- Error classifications and task labels follow the definitions provided in the Methods section of the paper.
- This dataset is intended to support transparency, reproducibility, and secondary analyses.

---

## Coordinate Transformation Code (`Coordinate_transformation` branch)

### Overview

The `Coordinate_transformation` branch contains the MATLAB function:


This function converts native-space coordinates into MNI space using an inverse deformation field produced by SPM. It was used to derive the MNI coordinates reported in the dataset.

### Function Summary

`GetMNICoord`:
- Takes native-space coordinates (in millimeters) and an inverse deformation field (`iy_*.nii`) as input
- Converts coordinates to voxel space using the image affine matrix
- Samples the inverse deformation field to obtain MNI coordinates
- Returns the transformed coordinates and prints them to the MATLAB command window

### Requirements

- MATLAB
- SPM (Statistical Parametric Mapping) toolbox  
  Required SPM functions include:
  - `spm_get_space`
  - `spm_vol`
  - `spm_sample_vol`

SPM must be installed and added to the MATLAB path.

---

## Relation Between Dataset and Code

The MNI coordinates reported in the dataset were obtained using standard SPM-based normalization procedures.  
The function provided in the `Coordinate_transformation` branch is shared to support methodological transparency and to enable replication or reuse of the coordinate transformation procedure in related studies.

---

## Citation

If you use this dataset or the accompanying code, please cite the associated publication:

> *Sukunda et al. (in press). Mapping the neural substrates of verbal and sign language: A single-case study using direct electrical stimulation.*

In addition, please cite SPM if you use the coordinate transformation code.
