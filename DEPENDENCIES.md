# Dependencies

No specific MATLAB version is recorded. The scripts use `imshow`,
`edge`, `bwlabel`, `regionprops`, and `imfill`, which require MATLAB's
**Image Processing Toolbox**. `ginput`, `imread`, and `uigetfile` are
core MATLAB.

## Input/output

`EB3a.m`, `calculateRadii.m`, `eb1angles.m`, `track2Poles.m`,
`track3Poles.m`, `trackPoles.m`, and `fsmPrepScaleSpace.m` all prompt
interactively for their input image(s) via `uigetfile`, and pole
positions are selected by clicking on the image via `ginput`; none of
them require a hardcoded image path to run. The one hardcoded absolute
path present in the codebase (in `EB3a.m`) is already commented out.
