# Figure 1A

# Add type of variant information to main table
Table_S2$Fus_type <- "interchromosomal"
Table_S2$Fus_type[which(Table_S2$contig1 == Table_S2$contig2)] <- "intrachromosomal"

Fusions_statistic <- as.data.frame(table(Table_S2$type, Table_S2$Fus_type))

# Step 1: Create the fusion statistic clean dataframe
FS_clean <- Fusions_statistic %>%
  # Extract the main category before any "/"
  mutate(Category = str_extract(Var1, "^[^/]+")) %>%
  # Filter to keep only the four categories
  filter(Category %in% c("deletion", "duplication", "inversion", "translocation")) %>%
  # Group by category and sum frequencies
  group_by(Category) %>%
  summarise(Total_Freq = sum(Freq, na.rm = TRUE)) %>%
  # Calculate percentage
  mutate(Percent = Total_Freq / sum(Total_Freq) * 100,
         Label = paste0(round(Percent, 1), "%"))

# Step 2: Create the pie chart with labels
Event_type <- ggplot(FS_clean, aes(x = "", y = Total_Freq, fill = Category)) +
  geom_col(width = 1) +
  coord_polar(theta = "y") +
  theme_void() +
  geom_text(aes(label = Label), position = position_stack(vjust = 0.5), color = "white", size = 4.5) +
  labs(title = "Fusion Event Types", fill = "Category")
print("Figure 1A: Fusion Event Types Percentages")
print(Event_type)
