# Descriptive statistics: groups summary and plot
library(dplyr)
library(ggplot2)
library(ggpubr)

load("Project 4 Filtered Data.RData")

#### Descriptive  Statistics ----

df_summary <- df |> group_by(task, congruency) |> summarise(mean_rt = mean(rt), sd_rt = sd(rt))
View(df_summary)

ggplot(data = df, aes(x = task, y = rt, color = congruency)) + 
  geom_jitter(position = position_jitter(width = 0.2, height = 0), alpha = 0.3, size = 0.5) + 
  geom_point(data = df_summary, aes(x = task, y = mean_rt, group = congruency, color = congruency),  position = position_dodge(1),size = 3) + 
  geom_errorbar(data = df_summary,  aes(x = task, y = mean_rt, group = congruency, ymin = mean_rt - sd_rt, ymax = mean_rt + sd_rt), position = position_dodge(1), width = 0.3) + 
  labs(x = "Task", y = "Reaction Time", color = "Congruency") + 
  theme_classic()
