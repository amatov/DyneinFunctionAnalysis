## DyneinFunctionAnalysis

## Quick start

This repository implements spindle-pole tracking and geometry analysis
for the meiotic spindle in Matlab. See
[DEPENDENCIES.md](DEPENDENCIES.md) for the Image Processing Toolbox
requirement. Each script prompts interactively for its input image(s).

## Repository contents

- `EB3a.m` -- EB3 comet feature detection.
- `calculateRadii.m`, `eb1angles.m`, `track2Poles.m`, `track3Poles.m`,
  `trackPoles.m` -- spindle-pole tracking and geometry, using
  `lineIntersect.m` to solve for pole positions via systems of linear
  Diophantine equations.
- `fsmPrepScaleSpace.m` -- a scale-space speckle-segmentation script.
- [`media/`](media/) -- an example video.
- **License:** see [LICENSE](LICENSE) -- research/educational use.

## About

Dynein function analysis

The Matlab code I wrote in summer 2007 in Woods Hole, MA to compute the extend of the spindle poles by solving systems of linear Diophantine equations for the publications:

Ge Yang, Lisa Cameron, Paul Maddox, Ted Salmon, Gaudy Danuser "Regional Variation of Microtubule Flux Reveals Microtubule Organization in the Metaphase Meiotic Spindle" (2008) and Jay Gatlin, Alex Matov, Aaron Groen, Dan Needleman, Tom Maresca, Gaudy Danuser, Tim Mitchison, Ted Salmon "Spindle Fusion Requires Dynein-Mediated Sliding of Oppositely Oriented Microtubules" (2009) 

For detailed information, see: https://www.researchgate.net/publication/387029369_Modulation_of_the_Cytoskeleton_for_Cancer_Therapy

