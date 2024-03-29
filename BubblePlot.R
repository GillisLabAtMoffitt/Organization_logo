# bubble plot

library(tidyverse)
library(ggplot2)
# library(viridis)
library(viridisLite)
# library(hrbrthemes)

matrix <- matrix(c(
  4.9-1, 11, .1,
  5-1, 10.8, .1,
  5-1, 10.9, 1,
  4.8-1, 11.9, .5,
  4.9-1, 12, .1,
  4.8-1, 13, .5,
  4.9-1, 12.5, .1,
  4.9-1, 14, .1,
  4.8-1, 13.5, 1,
  4.8-1, 14, .5,
  5-1, 14.5, .1,
  
  4.9-1, 14.5, .1,
  4.8-1, 14.8, .5,
  4.9-1, 15.5, .1,
  
  8, 13, .1,
  8.7, 12.9, .5,
  9.5, 12.8, .1,
  9.9, 12.7, .5,
  10, 12.9, .1,
  10, 12.4, 1,
  
  6.5, 10.7, 1,
  8, 10.8, .5,
  7.1, 10.7, .1,
  8.5, 11, .1,
  9, 11, .1,
  9.9, 10.9, .5,
  10, 11.5, .5,
  10.1, 11, .1,
  10, 12, .1,
  
  5-1, 15+1, 1,
  4.8-1, 15+1, .1,
  5.7-1, 15+1.1, .5,
  
  5, 15+1, 1,
  5.7, 15+1.1, .5,
  6, 15.3+1, .1,
  7.3, 15.4+1, .1,
  6.4, 15.2+1, .5,
  8, 15.3+1,  .5,
  9, 15+1, .1,
  9.8, 15+1, .1,
  10, 15+1, 1,
  
  16+1, 11, 1, # I
  16+1, 12, .1,
  16+1, 13.5, .1,
  16+1, 14, 1,
  16+1, 15, .1,
  15.9+1, 11.2, 1,
  16.2+1, 11.6, .1,
  16.1+1, 12.1, .5,
  16.2+1, 11.3, .5,
  15.9+1, 12.7, .5,
  16.1+1, 13.4, .5,
  16+1, 12.5, 1,
  16.1+1, 14.2, .5,
  15.9+1, 14.7, 1,
  15.9+1, 16.4, .5,
  16.1+1, 16, .1,
  
  25-1, 11, 1, # L
  25-1, 12, .5,
  25-1, 13, .1,
  25-1, 14, .1,
  25-1, 15, .5,
  25.5-1, 11, .1,
  24.9-1, 11.5, .5,
  25.1-1, 12.7, 1,
  25-1, 13.4, .5,
  24.9-1, 14.2, .1,
  24.9-1, 14, 1,
  26.9-1, 10.9, .5,
  25.2-1, 14.6, 1,
  28-1, 11, .5,
  29.5-1, 11, .1,
  30-1, 11, .1,
  30-1, 11, 1,
  
  35+1, 11, .5, # L
  35+1, 11.7, .5,
  35+1, 12.5, 1,
  35+1, 11, .1,
  35+1, 13.5, .5,
  35+1, 13, .5,
  35.1+1, 12.2, .1,
  35+1, 14.5, .1,
  35.2+1, 14.9, .1,
  35.1+1, 14.9, 1,
  34.9+1, 14.2, .1,
  34.9+1, 14.1, 1,
  36.5+1, 11.2, .5,
  37+1, 11, .1,
  37.5+1, 10.9, 1,
  38+1, 11, .1,
  39+1, 11, 1,
  40+1, 10.9, .5,
  
  45.1+2, 11, .1, # I
  45+2, 11.2, 1,
  44.9+2, 11.6, .1,
  45.1+2, 11.3, .5,
  44.9+2, 12, .1,
  45+2, 12.1, 1,
  45.2+2, 12.5, .5,
  45+2, 12.7, .5,
  45+2, 13.5, 1,
  45.1+2, 14, .5,
  45.2+2, 15, .1,
  45+2, 14.2, .1,
  45.1+2, 14.7, .5,
  45+2, 16.2, .1,
  45.1+2, 16.5, 1,
  
  50+3, 11, .1, # S
  50.9+3, 10.9, .1,
  51.6+3, 11, .1,
  50.2+3, 10.9, 1,
  53+3, 10.9, .1,
  53.5+3, 11, .1,
  50.6+3, 11, .5,
  51.3+3, 10.9, 1, 
  50+3, 13, 1,
  50+3, 13.4, .5,
  50+3, 14, .1,
  50+3, 14.2, .5,
  50+3, 14.8, .1,
  50+3, 15, .5,
  50.4+3, 15, 1,
  50.9+3, 13, .1,
  51.3+3, 13.1, .1,
  51.3+3, 15.1, .5,
  52.9+3, 15.1, 1,
  52.1+3, 13, .5,
  53+3, 11, .5,
  53+3, 13, 1,
  53+3, 15,  .1,
  54.3+3, 11, 1,
  54.5+3, 13, .1,
  54.5+3, 15.1, .1,
  55+3, 11, .5,
  55+3, 12, .1,
  55+3, 13, .5,
  55.2+3, 12.2, 1,
  54+3, 15.1, .5,
  55.2+3, 15, 1,
  
  12+6, 4, 1, # L"a""b"
  12+6, 4.7, .5,
  12+6, 5.9, .5,
  12.1+6, 6.5, .1,
  12+6, 7, .1,
  12+6, 6.9, .5,
  12+6, 7.5, 1,
  12+6, 8, .5,
  12.2+6, 4, .1,
  12.1+6, 5.2, 1,
  11.9+6, 5.2, .1,
  13.2+6, 3.9, .5,
  14.3+6, 3.9, 1,
  15+6, 4, .5,
  15.2+6, 4.1, .1,
  16.5+6, 4, 1,
  17+6, 4, .5,
  17.1+6, 3.9, .1,
  
  21.9+8, 4, .1, # "a" 32.5
  22+8, 3.9, 1,
  22+8, 4.7, .5,
  21.9+8, 5, .1,
  22.1+8, 5.2, 1,
  22.3+8, 6.5, .5,
  23+8, 7.5, .1,
  22.7+8, 7.5, 1,
  24.5+8, 8.3, .5,
  22.2+8, 6, .1,
  23.1+8, 5.9, .5,
  24.1+8, 5.9, .1,
  24.9+8, 5.9, .1,
  25.1+8, 5.9, .5,
  26.9+8, 5.9, .1,
  27.3+8, 3.8, 1, 
  27.3+8, 3.7, .1,
  27.2+8, 4, .1,
  27.2+8, 4, .5,
  27.1+8, 4.4, .5,
  27.2+8, 5.2, 1,
  27.1+8, 4.9, .1,
  27.1+8, 5.1, .5,
  26.9+8, 6.4, .5,
  26.5+8, 6.9, 1,
  26+8, 7.5, .5,
  25.4+8, 7.9, .1,
  26.2+8, 6.9, .1,
  
  32+10, 4, .5, # "b"
  31.4+10, 4.1, .5,
  32+10, 4.5, .1,
  32+10, 5.2, .1,
  31.9+10, 5, 1,
  32.1+10, 6, .5,
  31.9+10, 6.7, .5,
  31.9+10, 7, 1,
  31.9+10, 7.5, .1,
  32.1+10, 7.9, 1,
  31.9+10, 7.9, .1,
  31.4+10, 7.9, .5,
  33+10, 3.8, .5,
  33+10, 4, .1,
  34.5+10, 3.8, 1,
  35+10, 3.9, .1,
  36.1+10, 4, 1,
  36.8+10, 4.5, .1,
  37.1+10, 4.5, .5,
  37.3+10, 4.5, .1,
  37.1+10, 4.9, .5,
  36.7+10, 5.5, .5,
  33+10, 6, .1,
  33.4+10, 5.9, .1,
  34+10, 5.9, .5,
  34.4+10, 6, .5,
  35.5+10, 6, .1,
  36.7+10, 6.1, .1,
  36.5+10, 6.2, 1,
  37.1+10, 7, 1,
  37.2+10, 7.5, 1,
  37.2+10, 7.5, .1,
  37+10, 7.8, .5,
  33+10, 8.1,  .5,
  34.5+10, 8.2, .5,
  34.5+10, 8.1, .1,
  36.7+10, 7.9, .5,
  35.5+10, 8.1, .1,
  35.9+10, 8.1, 1,
  36.4+10, 8, .1,
  36.7+10, 7.7, .1
  
), ncol = 3, byrow = TRUE)
matrix <- as.data.frame(matrix)

df <- data.frame(color= as.factor(c(sample(seq(3),226, replace=T))))

data <- bind_cols(matrix,df)

ggplot(data, aes(x=V1, y=V2, size = V3, color = color)) +
  scale_x_continuous(limits = c(0, 60)) +
  scale_y_continuous(limit = c(2.5, 18)) +
  geom_point(alpha=0.7) +
  scale_size(range = c(3, 7), name="a") +
  scale_colour_viridis_d()+
  # viridis(n = 4, option = "D")+
  # scale_color_brewer(palette = "Set2") +
  theme_minimal(base_size = 11)+
  theme(legend.position = "none",
        axis.text.x=element_blank(),
        axis.text.y=element_blank(),
        axis.title.x=element_blank(),
        axis.title.y=element_blank(),
        # plot.title = element_text(family = "Times",
        #                           colour = "midnightblue",
        #                           size = 40, face = "bold")
        )# +
  # labs(title="Dr.")



theme_gray <- function (base_size = 11, base_family = "") {
  half_line <- base_size/2
  theme(
    line = element_line(colour = "black", size = 0.5, 
                        linetype = 1, lineend = "butt"), 
    rect = element_rect(fill = "lightgrey", colour = "black",
                        size = 0.5, linetype = 1),
    text = element_text(family = base_family, face = "plain",
                        colour = "black", size = base_size,
                        lineheight = 0.9,  hjust = 0.5,
                        vjust = 0.5, angle = 0, 
                        margin = margin(), debug = FALSE), 
    
    axis.line = element_blank(), 
    axis.text = element_text(size = rel(0.8), colour = "grey30"),
    axis.text.x = element_text(margin = margin(t = 0.8*half_line/2), 
                               vjust = 1), 
    axis.text.y = element_text(margin = margin(r = 0.8*half_line/2),
                               hjust = 1),
    axis.ticks = element_line(colour = "grey20"), 
    axis.ticks.length = unit(half_line/2, "pt"), 
    axis.title.x = element_text(margin = margin(t = 0.8 * half_line,
                                                b = 0.8 * half_line/2)),
    axis.title.y = element_text(angle = 90, 
                                margin = margin(r = 0.8 * half_line,
                                                l = 0.8 * half_line/2)),
    
    legend.background = element_rect(colour = NA), 
    legend.margin = unit(0.2, "cm"), 
    legend.key = element_rect(fill = "grey95", colour = "white"),
    legend.key.size = unit(1.2, "lines"), 
    legend.key.height = NULL,
    legend.key.width = NULL, 
    legend.text = element_text(size = rel(0.8)),
    legend.text.align = NULL,
    legend.title = element_text(hjust = 0), 
    legend.title.align = NULL, 
    legend.position = "right", 
    legend.direction = NULL,
    legend.justification = "center", 
    legend.box = NULL, 
    
    panel.background = element_rect(fill = "grey92", colour = NA),
    panel.border = element_blank(), 
    panel.grid.major = element_line(colour = "white"), 
    panel.grid.minor = element_line(colour = "white", size = 0.25), 
    panel.margin = unit(half_line, "pt"), panel.margin.x = NULL, 
    panel.margin.y = NULL, panel.ontop = FALSE, 
    
    strip.background = element_rect(fill = "grey85", colour = NA),
    strip.text = element_text(colour = "grey10", size = rel(0.8)),
    strip.text.x = element_text(margin = margin(t = half_line,
                                                b = half_line)), 
    strip.text.y = element_text(angle = -90, 
                                margin = margin(l = half_line, 
                                                r = half_line)),
    strip.switch.pad.grid = unit(0.1, "cm"),
    strip.switch.pad.wrap = unit(0.1, "cm"), 
    
    plot.background = element_rect(colour = "white"), 
    plot.title = element_text(size = rel(1.2), 
                              margin = margin(b = half_line * 1.2)),
    plot.margin = margin(half_line, half_line, half_line, half_line),
    complete = TRUE)
}
