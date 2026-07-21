# 📊 An Ecological and Longitudinal Analysis of the African Continent (2010–2024): Modeling AIDS-Related Mortality, ART Coverage, and HIV Incidence Across 54 Countries


### 🧠 Author: Uthman Al-Ameen Olalekan  
*MPH, University of Ibadan, Nigeria*  
---

## 📌 Overview


This project presents a comprehensive longitudinal analysis of HIV-related indicators across all 54 African countries from 2010 to 2024, covering 810 country-year observations, derived from a larger raw dataset of 2,916 rows. The analysis, including data cleaning, statistical modeling, and geospatial visualizations, was independently conducted using R.

Unlike many previous studies that primarily focus on Sub-Saharan Africa, this research provides a truly continental-wide perspective by incorporating all seven countries of North Africa, often underrepresented in comparative analyses. By including both Sub-Saharan and North African countries, this project addresses a critical research gap and offers a more comprehensive understanding of HIV-related trends across the entire African continent.

This manuscript is currently under review at BMC Infectious Diseases (Springer Nature).
> 📄 **Preprint Notice:**  
> This study was previously shared as a preprint on *Research Square*:  
> **Uthman Olalekan Al-Ameen (2025).** *Ecological and Longitudinal Analysis of the African Continent (2010–2024): Modeling AIDS-Related Mortality, ART Coverage, and HIV Incidence Across 54 Countries.*  
> 🔗 DOI: [https://doi.org/10.21203/rs.3.rs-7483580/v1](https://doi.org/10.21203/rs.3.rs-7483580/v1)  
> 📜 *This is a preprint and is currently under peer review.*  
> Licensed under a **CC BY 4.0 License**.

This repository provides all code, datasets, and outputs to promote transparency and reproducibility

---

## 🧪 Objective

To examine the trends and relationships between:

- **HIV Incidence Rate**
- **ART Coverage (%)**
- **AIDS-Related Mortality Rate**

...across African countries, and identify regional patterns and epidemiological insights using reproducible data science workflows.

---

## 📂 Data Sources

- [UNAIDS](https://aidsinfo.unaids.org/)
- [World Health Organization (WHO)](https://www.who.int/data)
- [World Bank DataBank](https://databank.worldbank.org/)

> 📝 Note: Africa comprises 54 countries, but only 51 had complete records across the variables studied. Therefore the final analysis was based on 51 countries.

---

## 🔧 Methods


## 🔧 Methods

- **Study Design:** Longitudinal ecological study
- **Data Sources:** WHO Global Health Observatory and UNAIDS
- **Data Wrangling:** Cleaning, merging, reshaping, and quality assessment
- **Data Cleaning:** Exclusion of countries with substantial missing information
- **Statistical Analyses:**
  - Descriptive Statistics
  - Shapiro–Wilk Normality Test
  - Spearman Rank Correlation
  - Fixed-Effects Panel Regression
  - Hausman Specification Test
  - Cluster-Robust Standard Errors
  - Linear Mixed-Effects Model (Sensitivity Analysis)
- **Visualization:**
  - Choropleth Maps
  - Country-specific Longitudinal Trend Plots
---

## 📈 Sample Visualizations

<!-- Replace with your uploaded images -->
![HIV Incidence Trend](https://github.com/uthmanolanase/HIV-Continental-Study-Africa/blob/main/outputs/maps/HIV_Incidence_Map_2024.png)  
![ART Coverage Over Time](https://github.com/uthmanolanase/HIV-Continental-Study-Africa/blob/main/outputs/maps/ART_Coverage_Map_2024.png)  
![AIDS-Related Mortality](https://github.com/uthmanolanase/HIV-Continental-Study-Africa/blob/main/outputs/maps/AIDS_Mortality_Map_2024.png)
![HIV Incidence Trend](https://github.com/uthmanolanase/HIV-Continental-Study-Africa/blob/main/outputs/maps/HIV_Incidence_by_Country.png)
![ART Coverage Over Time](https://github.com/uthmanolanase/HIV-Continental-Study-Africa/blob/main/outputs/maps/ART_Coverage_by_Country.png)
---

## 🗂️ Project Structure

```bash

📦 HIV-Continental-Study-Africa
├── data/
│   ├── raw/                   # Original downloaded datasets
│   └── cleaned/               # Cleaned and processed datasets
├── scripts/
│   ├── 01_data_wrangling.R
│   ├── 02_visualization.R
│   └── 03_analysis.R
├── output/
│   └── plots/                 # Exported charts and graphs
├── README.md                  # Project summary and instructions
└── HIV_Continental_Analysis_Report.pdf
```

## 📊 Key Findings

- ART coverage increased substantially across Africa between 2010 and 2024 but remained highly heterogeneous across countries.

- Greater ART coverage was consistently associated with lower AIDS-related mortality after accounting for HIV incidence and country-level heterogeneity.

- HIV incidence remained a significant positive predictor of AIDS-related mortality throughout the study period.

- A weak positive ecological association was observed between ART coverage and HIV incidence, likely reflecting ART scale-up in higher HIV-burden countries rather than a causal relationship.

- Geographic maps demonstrated substantial regional disparities in HIV incidence, ART coverage, and AIDS-related mortality across the African continent.

- Fixed-effects panel regression and linear mixed-effects sensitivity analyses produced consistent findings, supporting the robustness of the results.
---
# How to Reproduce
1. Clone the repository 

```
git clone https://github.com/uthmanolanase/HIV-Continental-Study-Africa.git
 ```
2. Ensure you have R installed with required packages (tidyverse, plm, lme4, sf, ggplot2, viridis, etc.).

3. Run the HIV_Africa_Analysis.R script step-by-step.
4. All outputs, including clean datasets and maps, will be generated in the outputs/ folder.
## 🎓 Academic Relevance

This project reflects **doctoral-level independence**, coding proficiency, and strong epidemiological reasoning. It was **entirely conceptualized, coded, and authored by the researcher** and serves as a foundation for high-level research, international conference presentation, and PhD/postdoctoral applications in global health and epidemiology.

---
## 🤝 Contributions
---
This project was independently designed, analyzed, and documented by Uthman Olalekan Al-Ameen as part of a self-driven effort to promote data-driven health research in Africa.

---
## 🔗 Related Project  

📊 [Analysis of Drug-Resistant Tuberculosis (2010–2024)](https://github.com/uthmanolanase/README.md/blob/main/README.md)  

Together with this HIV analysis, the TB project showcases a broader **infectious disease epidemiology portfolio**, demonstrating reproducible workflows across two major global health challenges.  

---
---🔗 License
This project is shared for educational and research purposes. Please contact the author for permission before reuse.
## 📫 Contact

**Uthman Al-Ameen Olalekan**  
📧 uthmanolanase01@gmail.com  
🔗 [View Full Project](https://github.com/uthmanolanase/HIV-Continental-Study-Africa/blob/main/HIV_Africa_Analysis_Code_and_Output.pdf)  
🧾 CV available upon request

---

## 🔗 Citation

> Uthman, A. (2025). _Continental Analysis of HIV Incidence, ART Coverage, and AIDS-related Mortality in Africa, 2010–2024_. Manuscript submitted to * _BMC Infectious Diseases_*.
---
