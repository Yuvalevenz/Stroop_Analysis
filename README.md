# Stroop_Analysis
## R Course practice
### This project includes:
Raw & filtered data (4.1), Descriptive statistics (4.2), Statistical Analysis (4.3)
```df_summary <- df |> group_by(task, congruency) |> summarise(mean_rt = mean(rt), sd_rt = sd(rt))
View(df_summary)```
