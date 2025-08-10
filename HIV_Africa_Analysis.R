# ===========================================================
# Ecological and Longitudinal Analysis of HIV Indicators Across Africa (2010–2024)
# Author: Uthman Olalekan Al-Ameen, MPH
# Description: Full reproducible pipeline for data cleaning, transformation, modeling, and visualization
# ===========================================================

# -------------------------
# 1. Load Required Libraries
# -------------------------
library(tidyverse)
library(stringi)
library(readr)
library(flextable)
library(officer)
library(scales)
library(plm)
library(lme4)
library(sf)
library(rnaturalearth)
library(rnaturalearthdata)
library(ggrepel)
library(viridis)
library(ggpubr)

# -------------------------
# 2. Load Raw Datasets
# -------------------------
africa <- read_csv("data/raw/africa.csv")
art_coverage <- read_csv("data/raw/art_coverage.csv")
hiv_incidence <- read_csv("data/raw/hiv_incidence.csv")
aids_mortality <- read_csv("data/raw/aids_mortality.csv")

# -------------------------
# 3. Extract and Complete African Countries List
# -------------------------
african_countries <- africa %>%
  filter(`Location type` == "Country") %>%
  distinct(Location) %>%
  rename(Country = Location)

missing_countries <- tibble(Country = c("Egypt", "Libya", "Morocco", "Sudan", "Tunisia", "Somalia", "Djibouti"))
african_countries <- bind_rows(african_countries, missing_countries)

african_countries_clean <- african_countries$Country %>%
  stri_trans_general("Latin-ASCII") %>%
  tolower() %>%
  trimws()

# -------------------------
# 4. Filter Datasets for African Countries
# -------------------------
clean_country_names <- function(df) {
  df %>%
    mutate(Country_clean = stri_trans_general(Country, "Latin-ASCII") %>% tolower() %>% trimws()) %>%
    filter(Country_clean %in% african_countries_clean) %>%
    select(-Country_clean)
}

art_filtered <- clean_country_names(art_coverage)
hiv_filtered <- clean_country_names(hiv_incidence)
mortality_filtered <- clean_country_names(aids_mortality)

# -------------------------
# 5. Reshape to Long Format
# -------------------------
art_long <- art_filtered %>%
  pivot_longer(cols = starts_with("20"), names_to = "Year", values_to = "ART_Coverage")

hiv_long <- hiv_filtered %>%
  pivot_longer(cols = starts_with("20"), names_to = "Year", values_to = "HIV_Incidence")

mortality_long <- mortality_filtered %>%
  pivot_longer(cols = starts_with("20"), names_to = "Year", values_to = "AIDS_Mortality")

# -------------------------
# 6. Clean and Merge Datasets
# -------------------------
art_long <- art_long %>% filter(str_detect(Year, "^[0-9]{4}$")) %>% mutate(Year = as.integer(Year))
hiv_long <- hiv_long %>% filter(str_detect(Year, "^[0-9]{4}$")) %>% mutate(Year = as.integer(Year))
mortality_long <- mortality_long %>% filter(str_detect(Year, "^[0-9]{4}$")) %>% mutate(Year = as.integer(Year))

common_data <- art_long %>%
  inner_join(hiv_long, by = c("Country", "Year")) %>%
  inner_join(mortality_long, by = c("Country", "Year"))

# -------------------------
# 7. Remove Countries with Incomplete Data
# -------------------------
countries_to_remove <- c("Cameroon", "Central African Republic", "Equatorial Guinea",
                         "São Tomé and Príncipe", "Sao Tome and Principe", "Benin")

common_data <- common_data %>% filter(!Country %in% countries_to_remove)

# -------------------------
# 8. Handle "<" Scenario: Replace with Midpoints
# -------------------------
common_data <- common_data %>%
  mutate(across(c(ART_Coverage, HIV_Incidence, AIDS_Mortality), ~ {
    num <- parse_number(., locale = locale(grouping_mark = " "))
    ifelse(str_detect(., "^<"), num / 2, num)
  }))

# -------------------------
# 9. Save Cleaned Dataset
# -------------------------
write_csv(common_data, "data/processed/common_data_cleaned.csv")

# -------------------------
# 10. Summary Table of Extreme Values
# -------------------------
summary_table <- tibble(
  Indicator = c("Minimum ART Coverage", "Maximum ART Coverage",
                "Minimum HIV Incidence", "Maximum HIV Incidence",
                "Minimum AIDS Mortality", "Maximum AIDS Mortality"),
  Value = c("1% (South Sudan, 2010)", "96% (Rwanda, 2023)",
            "100 (South Sudan, 2010)", "7,700,000 (South Africa, 2023)",
            "50 (Mauritania, 2010)", "150,000 (South Africa, 2010)")
)

flextable(summary_table)

# -------------------------
# 11. Correlation Analyses
# -------------------------
cor.test(common_data$ART_Coverage, common_data$HIV_Incidence, method = "spearman")
cor.test(common_data$ART_Coverage, common_data$AIDS_Mortality, method = "spearman")
cor.test(common_data$HIV_Incidence, common_data$AIDS_Mortality, method = "spearman")

# -------------------------
# 12. Regression Analyses
# -------------------------
summary(lm(AIDS_Mortality ~ ART_Coverage + HIV_Incidence, data = common_data))

panel_data <- pdata.frame(common_data, index = c("Country", "Year"))
model_fe <- plm(AIDS_Mortality ~ ART_Coverage + HIV_Incidence, data = panel_data, model = "within")
summary(model_fe)

model_gcm <- lmer(AIDS_Mortality ~ ART_Coverage + Year + (1 | Country), data = common_data)
summary(model_gcm)

# -------------------------
# 13. Time Series Visualizations
# -------------------------
ggplot(common_data, aes(x = Year)) +
  geom_line(aes(y = ART_Coverage, color = "ART Coverage")) +
  geom_line(aes(y = HIV_Incidence / 10000, color = "HIV Incidence (scaled)")) +
  geom_line(aes(y = AIDS_Mortality / 1000, color = "AIDS Mortality (scaled)")) +
  facet_wrap(~ Country) +
  scale_x_continuous(breaks = seq(2010, 2023, 2)) +
  labs(title = "HIV Indicators Across African Countries (2010–2023)",
       y = "Value (scaled)", color = "Indicator") +
  theme_minimal()

# -------------------------
# 14. 2024 Mapping of Indicators
# -------------------------
map_data_2024 <- common_data %>%
  filter(Year == 2024) %>%
  mutate(Country = case_when(
    Country == "South Sudan" ~ "S. Sudan",
    Country == "United Republic of Tanzania" ~ "Tanzania",
    Country == "Democratic Republic of the Congo" ~ "Dem. Rep. Congo",
    Country == "Eswatini" ~ "eSwatini",
    TRUE ~ Country
  ))

africa_shp <- ne_countries(continent = "Africa", returnclass = "sf") %>% st_make_valid()

map_data <- left_join(africa_shp, map_data_2024, by = c("name" = "Country"))

map_data$centroid <- st_centroid(st_geometry(map_data))
coords <- st_coordinates(map_data$centroid)
map_data$X <- coords[, 1]
map_data$Y <- coords[, 2]

# HIV Incidence Map
ggplot(map_data) +
  geom_sf(aes(fill = HIV_Incidence), color = "grey50", size = 0.3) +
  geom_text(aes(x = X, y = Y, label = name), size = 2) +
  scale_fill_viridis(option = "plasma", direction = -1, na.value = "white", name = "HIV Incidence", labels = comma) +
  theme_minimal() +
  ggtitle("HIV Incidence in Africa (2024)")

# ART Coverage Map
ggplot(map_data) +
  geom_sf(aes(fill = ART_Coverage), color = "grey50", size = 0.3) +
  geom_text(aes(x = X, y = Y, label = name), size = 2) +
  scale_fill_viridis(option = "cividis", direction = -1, na.value = "white", name = "ART Coverage (%)") +
  theme_minimal() +
  ggtitle("ART Coverage in Africa (2024)")

# AIDS Mortality Map
ggplot(map_data) +
  geom_sf(aes(fill = AIDS_Mortality), color = "grey50", size = 0.3) +
  geom_text(aes(x = X, y = Y, label = name), size = 2) +
  scale_fill_viridis(option = "magma", direction = -1, na.value = "white", name = "AIDS Mortality", labels = comma) +
  theme_minimal() +
  ggtitle("AIDS-Related Mortality in Africa (2024)")

# ===========================================================
# End of Script — All analyses and visualizations are reproducible
# ===========================================================

