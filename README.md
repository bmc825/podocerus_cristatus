# Data Analysis of *Podocerus cristatus*

**Principal Investigator:** Brittany Cummings  
**Date:** 2025-01-01

---

## Project Overview

This repository contains the data analysis pipeline for investigating color polymorphism, microhabitat associations, and population structure in the marine amphipod *Podocerus cristatus*. This study represents the first comprehensive natural history survey of *P. cristatus*, combining population-level ecological data, camouflage strategy modeling, and genetic analyses.

Color polymorphism, an important source of intraspecific diversity, may be shaped by adaptive responses to visual predation or by nonadaptive processes. Here, we examine how morph-specific ecology, habitat use, and population structure influence color variation in *P. cristatus*, a species suspected to form a complex of cryptic lineages across the Pacific.

---

## Background

*Podocerus cristatus* inhabits branching subtidal substrates (hydroids, red algae, sponges) and displays striking color polymorphism. While many individuals are cryptically colored to blend into their environment, others exhibit bright coloration or red fluorescence, suggesting potential strategies like Batesian mimicry or alternative camouflage mechanisms.

Previous observations hinted at ecological differences among morphs, but no baseline data existed to confirm these relationships. This study addresses that gap by quantifying color morph variation, camouflage performance, species occurrence, and population-level genetic structure.

---

## Hypotheses Tested

- **H1:** Camouflage strategies vary by microhabitat type.
- **H2:** Individuals select microhabitats that enhance concealment.
- **H3:** Certain morphs are sex-specific.
- **H4:** Camouflage strategies differ between sexes, with males exhibiting more disruptive coloration and females exhibiting more background matching.

---

## Repository Structure

```plaintext
CHAPTER3_DATA_ANALYSIS/
├── 01_Population/           # Population structure and morph classification
├── 02_Occurrence/           # Species occurrence models and analysis
├── 03_Camouflage/           # Camouflage strategies and microhabitat association models
├── 04_Phylogenetic/         # Phylogenetic analysis of genetic markers
├── Rmd_files/               # RMarkdown versions of notebooks for direct RStudio use
├── data/                    # (Optional) Data files or instructions to access data
├── images/                  # Figures and visuals for notebooks
├── scripts/                 # Supporting R scripts
├── intro.md                 # Overall project introduction
├── _config.yml              # Jupyter Book configuration
├── _toc.yml                 # Table of Contents configuration
└── 00-README_JUPYTER.txt     # Additional notes for local Jupyter Book usage
```

---

## Usage Instructions

1. **Clone the repository:**
    ```bash
    git clone https://github.com/your-username/chapter3_data_analysis.git
    ```

2. **Install dependencies:**
    - Install [Jupyter Book](https://jupyterbook.org/en/stable/start/overview.html).
    - Ensure you have an R environment with required packages (e.g., `tidyverse`, `brms`, `renv`).

3. **Build the book locally:**
    - By default, model code in the `.ipynb` notebooks is commented out, and the book will instead access previously generated models saved as `.rds` files (see #4). This is done to save time and retain consistency of results.
    - If you prefer, you can remove these comment marks to rerun all models during book building. Note that generating models in this way will take a LONG time, and the results will vary slightly with each iteration.

    ```bash
    jupyter-book build .
    ```

4. **Run models manually (optional):**
    - Open `.Rmd` files in RStudio if you prefer R workflows. This saves considerable time during troubleshooting, since you can run one code chunk at a time.
    - Alternatively, you can run models through `.ipynb` notebooks using an R kernel in Jupyter, but note that you must execute all code chunks in a notebook sequentially.


---

## Citation

If you use this pipeline or its components, please cite the following works relevant to *Podocerus cristatus* ecology and visual camouflage:

> Bond (2007), Chapman (2007), Boyd et al. (2002), Goddard (2016), Cronin et al. (2014), Hobson (1968), Johnsen (2012), Thomson (1879).

(See full references inside the repository.)

---

## License

This project is shared for transparency and educational purposes.  
License information (e.g., MIT, CC-BY) to be added.

---

# References

- Barnard, J. L. (1962). *Benthic marine Amphipoda of southern California...* Pacific Naturalist, 3(1):1–72.
- Bond, A. B. (2007). *The Evolution of Color Polymorphism...* Annual Review of Ecology, Evolution, and Systematics, 38(1):489–514.
- Boyd, M. J., Mulligan, T. J., & Shaughnessy, F. J. (2002). *Non-indigenous marine species of Humboldt Bay.*
- Chapman, J. W. (2007). *Amphipoda: Gammaridea.* In *The Light and Smith Manual...*
- Cronin, T. W., Johnsen, S., Marshall, N. J., & Warrant, E. J. (2014). *Visual Ecology.*
- Goddard, J. H. R. (2016). *Latitudinal variation in mimicry...* Marine Biodiversity, 46(3):535–537.
- Hobson, E. S. (1968). *Predatory behavior of some shore fishes...*
- Johnsen, S. (2012). *The Optics of Life.*
- Thomson, G. M. (1879). *Additions to the amphipodous Crustacea of New Zealand.*

---

# Quick Notes

- This project was conducted under the direction of Brittany Cummings (2025).
- Some data and figures are available upon request if not included in this public version.

