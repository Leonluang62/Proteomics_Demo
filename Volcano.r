# examples
# Load required libraries
library(ggplot2)
library(ggvolcano)

# Create example data
set.seed(123)
example_data <- data.frame(
    gene = paste0("Gene", 1:100),
    log2FC = rnorm(100, 0, 2),
    pvalue = runif(100, 0, 0.1)
)
#test <- example_data[1:10, ]
# Basic volcano plot using ggplot2
example_data$negLog10P <- -log10(example_data$pvalue)
volcano_plot <- ggplot(example_data, aes(x = log2FC, y = negLog10P)) +
    geom_point(aes(color = pvalue < 0.05 & abs(log2FC) > 1)) +
    scale_color_manual(values = c("grey", "red")) +
    labs(title = "Volcano Plot (ggplot2)",
         x = "log2 Fold Change",
         y = "-log10(p-value)") +
    theme_minimal()

print(volcano_plot)

print("Volcano plot created using ggplot2.")