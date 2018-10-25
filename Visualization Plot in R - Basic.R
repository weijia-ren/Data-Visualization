.libPaths(c(.libPaths(),"c:/3.4"))

# install packages
install.packages("ggplot2")

############################################################
###     Basic Plot coming with R Basic            ##########
### Histogram, Bar Plot, Boxplot,  Pie Chart, Scatter plot #
############################################################

##### using the dataset iris as an example ###

head(iris)

### R Basics

## Histogram
hist(iris$Sepal.Length)
## Bar plot
barplot(table(iris$Species))
## Box plot
boxplot(Sepal.Length ~ Species, data = iris)
### Pie Chart
pie(c(1,1,1),levels(iris$Species))
### Scatter Plot
plot(iris$Sepal.Length, iris$Sepal.Width)


#######################################################
########  Plot with package ggplot2           #########
#######################################################
# Strength:
#- The understandable logic of the grammar.
#- The automatic statistical calculation.
#- Automatic legends, colors, etc.
#- Nice output.
#- Easy to extend.

# General format: 
# ggplot (data, aes(x, y))+
#   geom_point(aes(color=z))+
#   geom_smooth(method="lm")+
#   coord_cartesian()+
#   scale_color_gradient()+
#   theme_bw()+
#   facet_grid(x~.)+
#   scale_color_manual(c("red","blue","green"))+
#   labs(x="xxx", y="yyy", color="color")+
#   geom_abline(intercept=0, slope=1)+
#   geom_vline(data=a, aes(xintercept=var1, color="Mean"), linetype="dashed", size=1)+
#   theme(legend.position="bottom",legend.box = "vertical",legend.title = element_blank(),
#   legend.text=element_text(size=8))+theme(strip.text.y = element_text(size = 7))
                     
  

# save graph: 
#   ggsave("plot.png", width = 5, height = 5)

library(ggplot2)

############### One Variable  (Categorical) #######################
## Barplot
ggplot(iris) +
  geom_bar(aes(x = Species, fill = Species),alpha=0.5)


############### One Variable  (Continuous) #######################
## Histogram
ggplot(iris) +
  geom_histogram(aes(x = Sepal.Length),bins=30, color="blue", fill="light blue", alpha=0.5)
#note: binwidth=0.1 or bins=30
## Dot plot
ggplot(iris) +
  geom_dotplot(aes(x = Sepal.Length),color="blue", fill="light blue", alpha=0.5)
## Area under the curve
ggplot(iris) +
  geom_area(aes(x = Sepal.Length),stat="bin",bins=30, color="blue", fill="light blue", alpha=0.5)
## Frequency polygram
ggplot(iris) +
  geom_freqpoly(aes(x = Sepal.Length),stat="bin",bins=30, color="blue", fill="light blue", alpha=0.5)
## Density function
ggplot(iris) +
  geom_density(aes(x = Sepal.Length),color="blue", fill="light blue", alpha=0.5)
## qqplot
ggplot(iris) + 
  geom_qq(aes(sample = Sepal.Length),color="blue", fill="light blue", alpha=0.5)

############### Two Variables  (Categorical X vs. Categorical Y) #######################
## jitter plot: dots were not plotted on top of each other, 
#assign random error to dot so that each dot is separated from others
ggplot(iris) +
  geom_jitter(aes(x = Species,y = Petal.Width),color="blue", fill="light blue", alpha=0.5)

############### Two Variables  (Categorical X vs. Continuous Y) #######################
# Bar graph by the categorical X
ggplot(iris) +
  geom_bar(aes(x = Species,y = Petal.Width),stat="identity",color="blue", fill="light blue", alpha=0.5)
# Box-plot
ggplot(iris) +
  geom_boxplot(aes(x = Species,y = Petal.Width),color="blue", fill="light blue", alpha=0.5)
# dot plot
ggplot(iris) +
  geom_dotplot(aes(x = Species,y = Petal.Width),stackdir="center",binaxis="y",binwidth=0.1,
               color="blue", fill="light blue",alpha=0.5)
# violin plot
ggplot(iris) +
  geom_violin(aes(x = Species,y = Petal.Width),scale="area",color="blue", fill="light blue", alpha=0.5)

############### Two Variables  (Continuous X vs. Continuous Y) #######################  
# jitter plot
ggplot(iris) +
  geom_jitter(aes(x = Sepal.Length,y = Sepal.Width),color="blue", fill="light blue", alpha=0.5)
# scatter plot (simple version)
ggplot(iris) +
  geom_point(aes(x = Sepal.Length,y = Sepal.Width),color="blue", fill="light blue", alpha=0.5)
# scatter plot (complex version)
ggplot(iris) + 
  geom_point(aes(x = Sepal.Length, y = Sepal.Width, colour = Species, size=Petal.Width),alpha=0.5)+
  stat_smooth(aes(x = Sepal.Length, y = Petal.Length))+
  facet_grid(Species ~ .)+
  scale_color_manual(values=c("red","blue","green"))
# quantile line
ggplot(iris) +
  geom_quantile(aes(x = Sepal.Length,y = Sepal.Width),color="blue", size=1, alpha=0.5)
# rug plot 
ggplot(iris) +
  geom_rug(aes(x = Sepal.Length,y = Sepal.Width),sides="bl",color="blue", size=1, alpha=0.5)
# smooth line
ggplot(iris) +
  geom_smooth(aes(x = Sepal.Length,y = Sepal.Width),method=loess,color="blue", size=1)
# scatterplot with text instead of dot on the plot
ggplot(iris) +
  geom_text(aes(x = Sepal.Length,y = Sepal.Width,label=Species,color=Species), size=5)
# polygon graph
ggplot(iris) +
  geom_polygon(aes(x = Sepal.Length,y = Sepal.Width),color="blue", fill="light blue", alpha=0.5)
# path graph: similar to polygon but no fill
ggplot(iris) +
  geom_path(aes(x = Sepal.Length,y = Sepal.Width),color="blue", alpha=0.5)
# ribbon plot: with a ribbon (i.e. CI) around the y-variable
ggplot(iris) +
  geom_ribbon(aes(x=Sepal.Length, ymin = Sepal.Width-0.3,ymax = Sepal.Width+0.3),color="blue", fill="light blue",alpha=0.5)
# segment plot: draw a line for each observation (i.e. changing-value plot)
ggplot(iris) +
  geom_segment(aes(x=Sepal.Length,xend=Sepal.Length+1, y = Sepal.Width,yend = Sepal.Width+1),color="blue", alpha=0.5)
# rectangle plot: draw a rectangle for each observation 
ggplot(iris) +
  geom_rect(aes(xmin=Sepal.Length,xmax=Sepal.Length+1, ymin = Sepal.Width,ymax = Sepal.Width+1),color="blue", fill="light blue",alpha=0.5)
# bivariate distribution
ggplot(iris) +
  geom_bin2d(aes(x=Sepal.Length,y=Sepal.Width),color="blue", alpha=0.5,binwidth=c(0.1,0.1))
# bivariate density distribution
ggplot(iris) +
  geom_density2d(aes(x=Sepal.Length,y=Sepal.Width),color="blue", alpha=0.5)
# bivariate density distribution
ggplot(iris) +
  geom_hex(aes(x=Sepal.Length,y=Sepal.Width),color="blue", alpha=0.5,binwidth=c(0.1,0.1))

## Area graph (connecting all the dots)
ggplot(iris) +
  geom_area(aes(x=Sepal.Length,y=Sepal.Width), color="blue", fill="light blue",alpha=0.5)
## line graph (connecting all the dots)
ggplot(iris) +
  geom_line(aes(x=Sepal.Length,y=Sepal.Width), color="blue", alpha=0.5)
## step graph (connecting all the dots)
ggplot(iris) +
  geom_step(aes(x=Sepal.Length,y=Sepal.Width), color="blue", alpha=0.5)


############### Visualizing the error #######################
# Crossbar graph
ggplot(iris) +
  geom_crossbar(aes(x=Sepal.Length,y=Sepal.Width,ymin=Sepal.Width-0.1,ymax=Sepal.Width+0.1),
                    fatten=2,color="blue", alpha=0.5)
# Errorbar graph
ggplot(iris) +
  geom_errorbar(aes(x=Sepal.Length,ymin=Sepal.Width-0.1,ymax=Sepal.Width+0.1),
                color="blue", alpha=0.5)
# Line range graph
ggplot(iris) +
  geom_linerange(aes(x=Sepal.Length,ymin=Sepal.Width-0.1,ymax=Sepal.Width+0.1),
                color="blue", alpha=0.5)
# Point range graph
ggplot(iris) +
  geom_pointrange(aes(x=Sepal.Length,y=Sepal.Width,ymin=Sepal.Width-0.1,ymax=Sepal.Width+0.1),
                 color="blue", alpha=0.5, size=0.2)

##########################                     Map                     #######################

data <- data.frame(murder = USArrests$Murder, state = tolower(rownames(USArrests))) 
map <- map_data("state") 
ggplot(data, aes(fill = murder)) +geom_map(aes(map_id = state), map = map) +
  expand_limits(x = map$long, y = map$lat)



##########################       Three variables              #######################
# contour plot: longitude, latitude, and z 
seals$z <- with(seals, sqrt(delta_long^2 + delta_lat^2)) 
ggplot(seals)+
  geom_contour(aes(long, lat,z = z), color="blue", alpha=0.5, size=1)
# raster plot
ggplot(seals)+
  geom_raster(aes(long, lat,fill = z))
# tile plot, similar to the raster plot
ggplot(seals)+
  geom_tile(aes(long, lat,fill = z))


##########################       Scales              #######################

# to change the fill color
ggplot(iris) +
  geom_bar(aes(x = Species, fill = Species),alpha=0.5)+
  scale_fill_manual(values=c("skyblue","royalblue","blue"))

##########################       Coordinate System              #######################

ggplot(iris) + geom_bar(aes(x = Species, fill = Species),alpha=0.5)+
  coord_cartesian(xlim=c(0,4))
ggplot(iris) + geom_bar(aes(x = Species, fill = Species),alpha=0.5)+
  coord_fixed(ratio=1/2)
ggplot(iris) + geom_bar(aes(x = Species, fill = Species),alpha=0.5)+
  coord_flip()
ggplot(iris) + geom_bar(aes(x = Species, fill = Species),alpha=0.5)+
  coord_polar(theta="x",direct=1)


##########################       Theme              #######################

ggplot(iris) + geom_bar(aes(x = Species, fill = Species),alpha=0.5)+
  theme_classic()
ggplot(iris) + geom_bar(aes(x = Species, fill = Species),alpha=0.5)+
  theme_bw()
ggplot(iris) + geom_bar(aes(x = Species, fill = Species),alpha=0.5)+
  theme_grey()
ggplot(iris) + geom_bar(aes(x = Species, fill = Species),alpha=0.5)+
  theme_minimal()

##########################       Faceting              #######################
#seperate in different columns
ggplot(iris) + geom_bar(aes(x = Petal.Width, fill = Species),alpha=0.5)+
  facet_grid(.~Species, labeller=label_both)
#seperate in different rows
ggplot(iris) + geom_bar(aes(x = Petal.Width, fill = Species),alpha=0.5)+
  facet_grid(Species~., scales="free", labeller=label_parsed)
#seperate in both rows and columns
ggplot(iris) + geom_bar(aes(x = Petal.Width, fill = Species),alpha=0.5)+
  facet_grid(Petal.Width~Species)
# Wrap into a rectangular layout
ggplot(iris) + geom_bar(aes(x = Petal.Width, fill = Species),alpha=0.5)+
  facet_wrap(~Species)


##########################       Labels, Legend, Zoom              #######################
# Label
ggplot(iris) + geom_bar(aes(x = Petal.Width, fill = Species),alpha=0.5)+
  labs(title="Title", x="xxx", y="yyy")
# Legend position
ggplot(iris) + geom_bar(aes(x = Petal.Width, fill = Species),alpha=0.5)+
  theme(legend.position="bottom") # top, left, right
# change legend names
ggplot(iris) + geom_bar(aes(x = Petal.Width, fill = Species),alpha=0.5)+
  scale_fill_discrete(name="New",labels=c("A","B","C"))
# Zoom the plot to a specific area
ggplot(iris) + geom_bar(aes(x = Petal.Width, fill = Species),alpha=0.5)+
  coord_cartesian(xlim=c(0,1.5),ylim=c(10,20))

