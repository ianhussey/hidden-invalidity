# temp <- data.frame(Scale = c("Big 5 Inventory - E", "Big 5 Inventory - C", "Big 5 Inventory - N", 
#                              "Big 5 Inventory - A", "Big 5 Inventory - O"),
#                    alpha = rep(NA, 5),
#                    alpha_ci_lwr = rep(NA, 5),
#                    alpha_ci_upr = rep(NA, 5),
#                    omega_t = rep(NA, 5),
#                    omega_t_ci_lwr = rep(NA, 5),
#                    omega_t_ci_upr = rep(NA, 5),
#                    omega_h = rep(NA, 5),
#                    omega_h_ci_lwr = rep(NA, 5),
#                    omega_h_ci_upr = rep(NA, 5))
# 
# consistency_results <- consistency_results %>%
#   rbind(temp) %>%
#   filter(!(Scale %in% c("Big 5 Inventory - E,C,N", "Big 5 Inventory - A,O")))





# k items per scale
k_items_2 <- data.frame(Scale = c("Balanced Inventory of Desirable Responding",
                                  "Intuitions about Controllability and Awareness of Thoughts",
                                  "Need for Cognitive Closure",
                                  "Spheres of Control"),
                        `Items` = c(36, 18, 42, 20))

# k factors per scale
k_factors_2 <- data.frame(Scale = c("Balanced Inventory of Desirable Responding",
                                    "Intuitions about Controllability and Awareness of Thoughts",
                                    "Need for Cognitive Closure",
                                    "Spheres of Control"),
                          Factors = c(2, 2, 5, 2))





MI_temp_1 <- MI_combined_temp %>%
  filter(MI == 0) %>%
  mutate(MI_failed = as.character(MI_failed)) %>%
  group_by(Scale, Group) %>%
  summarize(MI_failed = list(MI_failed)) %>%  # solution to summarize strings: https://github.com/tidyverse/dplyr/issues/832 nb requirement to convert to character previously
  ungroup() %>%
  mutate(MI_failed = str_replace_all(MI_failed, "c\\(", ""),
         MI_failed = str_replace_all(MI_failed, "\\)", ""),
         MI_failed = str_replace_all(MI_failed, "\", \"", ", "),
         MI_failed = str_replace_all(MI_failed, "\"", "")) %>%
  spread(Group, MI_failed) %>%
  rename(MI_failed_age = age,
         MI_failed_gender = sex)

MI_temp_2 <- MI_combined_temp %>%
  group_by(Scale, Group) %>%
  summarise(MI = min(MI, na.rm = TRUE)) %>%
  ungroup() %>%
  spread(Group, MI) %>%
  rename(MI_age = age,
         MI_gender = sex)

MI_combined <- full_join(MI_temp_2, MI_temp_1, by = "Scale")