Extra <- Table_S1[which(Table_S1$Fus_TERT == "yes"), ]

print("Figure 3B: TERT expression plot")
print(ggplot(data = Table_S1, aes(x = "", y=normTERT)) +
  geom_boxplot(width = 0.5) +  # Adjust width if needed
  geom_point(data = Extra, aes(x = 1, y = normTERT, color = group), size = 3.5) + # Plot the highlighted points at the center
  labs(x = NULL, y = "Normalized TERT expression") +
  scale_color_manual(name = "TERT-Fusions",  # Change legend title
                     values = c("high" = "blue", "low" = "red"),  # Assign colors to groups
                     labels = c("high" = "TFB-H", "low" = "TFB-L")) +
  theme(legend.position = "bottom"))
