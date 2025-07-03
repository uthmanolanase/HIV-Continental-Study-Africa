# 📊 An Ecological and Longitudinal Analysis of the African Continent (2010–2023): Modeling AIDS-Related Mortality, ART Coverage, and HIV Incidence Across 54 Countries


### 🧠 Author: Uthman Al-Ameen Olalekan  
*MPH, University of Ibadan, Nigeria*  
*Prospective PhD Candidate in Epidemiology*

---

## 📌 Overview

This project presents a comprehensive longitudinal analysis of HIV-related indicators across all 54 African countries from 2010 to 2023. The analysis, including data cleaning, statistical modeling, and geospatial visualizations, was independently conducted using R.

The findings are currently under peer review at the International Journal of Epidemiology (2023 Impact Factor: 5.9, 5-Year IF: 8.4). This repository provides all code and outputs to promote transparency and reproducibility.

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

> 📝 Note: Africa comprises 54 countries, but only 48 had complete records across the variables studied. Therefore the final analysis was based on 48 countries.

---

## 🔧 Methods

- **Data Wrangling:** Cleaning, merging, reshaping, and handling missing data  
- **Imputation:** Scientific midpoint approximation for values represented as ranges (e.g., "<200")  
- **Statistical Analysis:**
  Data Cleaning & Standardization

- Descriptive Statistics & Extreme Value Identification

- Correlation Analyses (Spearman & Pearson)

- Multiple Linear Regression

- Panel Regression (Fixed Effects Model)

- Growth Curve Modeling (Multilevel Mixed Effects)


- **Visualizations:**
  - Line plots of longitudinal trends
  - Geographic Mapping using ggplot2 and sf  

---

## 📈 Sample Visualizations

<!-- Replace with your uploaded images -->
![HIV Incidence Trend](output/plots/hiv_incidence_trend.png)  
![ART Coverage Over Time](output/plots/art_coverage_trend.png)  
![AIDS-Related Mortality](output/plots/mortality_trend.png)

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

- Large disparities in ART coverage, ranging from 1% to 96% across countries.

- South Africa remains the epicenter of HIV incidence and AIDS-related mortality.

- Higher ART coverage is significantly linked to reduced HIV incidence and mortality.

- Spatial maps reveal clear geographic inequalities in HIV outcomes.

- Growth curve and panel regression models confirm ART scale-up reduces AIDS mortality over time.
---

## 🎓 Academic Relevance

This project reflects **doctoral-level independence**, coding proficiency, and strong epidemiological reasoning. It was **entirely conceptualized, coded, and authored by the researcher** and serves as a foundation for high-level research, international conference presentation, and PhD/postdoctoral applications in global health and epidemiology.

---
## 📄 Preprint Version Available

🤝 Contributions
This project was independently designed, analyzed, and documented by Uthman Olalekan Al-Ameen as part of a self-driven effort to promote data-driven health research in Africa.

---
---🔗 License
This project is shared for educational and research purposes. Please contact the author for permission before reuse.
## 📫 Contact

**Uthman Al-Ameen Olalekan**  
📧 uthmanolanase01@gmail.com  
🔗 [View Full Project on GitHub](https://github.com/uthmanolanase/HIV-Continental-Study-Africa)  
🧾 CV available upon request

---

## 🔗 Citation

> Uthman, A.A. (2025). _Continental Analysis of HIV Incidence, ART Coverage, and AIDS-related Mortality in Africa, 2000–2023_. Manuscript under review at *European Journal of Epidemiology*.
---
