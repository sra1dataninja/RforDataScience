setwd("C://Users//sparital//Documents//R Workspace")

getwd()

library(tidyverse)

data(mpg)
summary(mpg)

head(mpg)
tail(mpg)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x=displ, y = hwy))


ggplot(data = mpg) + 
  geom_point(mapping = aes(x=displ, y = hwy, color = displ < 4))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x=displ, y = hwy, size = class))

ggplot(data= mpg) +
  geom_point(mapping = aes(x=displ, y=hwy, alpha = class))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x=displ, y = hwy, shape = class))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x=displ, y = hwy, color = class, shape = class))


ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")


ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy,  color = "blue"))

summary(mpg)


    
    
ggplot(data = mpg) +
  geom_point(mapping = aes(x= displ, y= hwy)) +
  facet_wrap(~class, nrow = 3)



ggplot(data = mpg) +
  geom_point(mapping = aes(x= displ, y= hwy, color = class)) +
  facet_wrap(~hwy, nrow = 3)


ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class)) +
  facet_grid(drv ~ cyl)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)


ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class)) +
  facet_grid(. ~cyl)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)



####3.6 Geometric Objects

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y= hwy, color = class))

## change the point plot to smooth
## Important point geom function we cannot use shape and the line do not have any shape,

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x=displ, y= hwy))

## however we can use line type
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x=displ, y = hwy, linetype = drv))


ggplot(data = mpg) +
  geom_smooth(mapping = aes(x=displ, y = hwy, group = drv))


ggplot(data = mpg) +
  geom_smooth(mapping = aes(x=displ, y = hwy, color = drv),
              show.legend = TRUE
  )

## To show multiple geoms in the same plot
ggplot(data = mpg) +
  geom_point(mapping = aes(x=displ, y = hwy, color = class)) +
  geom_smooth(mapping = aes( x=displ, y=hwy))

## Passing as parameters
ggplot(data=mpg, mapping = aes(x=displ, y=cty)) +
  geom_point()+
    geom_smooth()

# Overriding of parameters in the local geom function
ggplot(data=mpg, mapping = aes(x=displ, y=cty)) +
  geom_point(mapping = aes(color = class))+
  geom_smooth(data = filter(mpg, class == 'suv'), se = FALSE)


### 3.6.1 Exercises
## What geom would you use to draw a line chart? A boxplot? A histogram? An area chart?

ggplot(data= mpg) +
  geom_boxplot(mapping = aes(x= class, y =hwy, color = drv), outlier.color = "red")

?geom_boxplot
?geom_smooth
## 2.

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth(se = FALSE)

## 6 Recreate the R code to generate the graphs as prescribed in the text book

#6.1
ggplot(data= mpg, mapping = aes(x= displ, y= hwy)) +
  geom_point() +
  geom_smooth(se = FALSE)


#6.2
ggplot(data= mpg, mapping = aes(x= displ, y= hwy)) +
  geom_point() +
  geom_smooth(mapping = aes(group = drv) , se = FALSE)

#6.3
ggplot(data= mpg, mapping=aes(x= displ, y = hwy, color = drv)) +
  geom_point()+
  geom_smooth(mapping = aes (group =drv, color = drv), se = FALSE, legend = TRUE)

#6.4

ggplot(data= mpg, mapping=aes(x= displ, y = hwy, color = drv)) +
  geom_point()+
  geom_smooth( se = FALSE, legend = TRUE)

#6.5

ggplot(data= mpg, mapping=aes(x= displ, y = hwy)) +
  geom_point(mapping = aes(color = drv))+
  geom_smooth(mapping = aes(linetype = drv, color = "blue"),se = FALSE, legend = TRUE)



base1 <- ggplot(data = mpg, mapping = aes(x = displ, y = hwy, group=drv))
base1 + geom_point() + geom_smooth(se = FALSE)
base1 + geom_smooth(se = FALSE) + geom_point()
base2 <- ggplot(data = mpg, mapping = aes(x = displ, y = hwy))
base2 + geom_point(aes(colour = drv)) + geom_smooth(aes(colour = drv), se=FALSE)
base2 + geom_point(aes(colour = drv)) + geom_smooth(se=FALSE)
base2 + geom_point(aes(colour = drv)) + geom_smooth(aes(linetype=drv), se=FALSE)
base2 + geom_point(size = 4, colour = "white") + geom_point(aes(colour = drv))
