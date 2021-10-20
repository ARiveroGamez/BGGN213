#Class 5: Data Visualization

library(ggplot2)
ggplot(cars)
head(cars)
tail(cars)
ggplot(data=cars)+aes(x=speed, y=dist)+
  geom_point()+ 
  geom_smooth(method="lm")+
  labs(title="Stopping Distance of Old Cars", 
       x="Speed (MPH)", 
       y="Stopping Distance (ft)")
# ggplot is not the only graphic system. Another is "base"
plot(cars)


url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)
tail(genes)
nrow(genes)
colnames(genes)
round(table(genes$State)/nrow(genes)*100,2)
p <- ggplot(genes)+aes(x=Condition1, y=Condition2, col=State)+ geom_point()
q <- p + scale_colour_manual(values=c("blue", "gray","red"))+
  labs(title = "Gene Expression Changes Upon Drug Treatment", 
       x="Control (No Drug)", y="Drug Treatment")
#First graph of the lab
q

#SECOND EXERCISE

library(gapminder)

library(dplyr)

gapminder_2007 <- gapminder %>% filter(year==2007)

ggplot(gapminder_2007) +
  aes(x=gdpPercap, y=lifeExp, color=continent, size=pop) +
  geom_point(alpha=0.5)
#Graph for 2007

ggplot(gapminder_2007) +
  geom_point(aes(x=gdpPercap, y=lifeExp, size=pop), alpha=0.5) +
  scale_size_area(max_size = 10)

r <- ggplot(gapminder_2007) +
  geom_point(aes(x=gdpPercap, y=lifeExp, size=pop), alpha=0.5) +
  scale_size_area(max_size = 10)
gapminder_1957 <- gapminder %>% filter(year==1957)
#Graph for 1957
ggplot(gapminder_1957) + 
  aes(x = gdpPercap, y = lifeExp, color=continent,size = pop) +
  geom_point(alpha=0.7) + 
  scale_size_area(max_size = 10)

t <-ggplot(gapminder_1957) + 
  aes(x = gdpPercap, y = lifeExp, color=continent,size = pop) +
  geom_point(alpha=0.7) + 
  scale_size_area(max_size = 10)

gapminder_1957and2007 <- gapminder %>% filter(year==1957 | year==2007)
#Comparison of 1957 and 2007
ggplot(gapminder_1957and2007) + 
  geom_point(aes(x = gdpPercap, y = lifeExp, color=continent,size = pop), alpha=0.7) + 
  scale_size_area(max_size = 10) + facet_wrap(~year)

ggplot(gapminder) + aes(x=year, y=lifeExp, col=continent)+geom_jitter(width=0.3,alpha=0.4)+
  geom_violin(aes(group=year), alpha=0.2, draw_quantiles = 0.5)

#Install the plotly 
#library(plotly)
#ggplotly()