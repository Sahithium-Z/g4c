from PIL import Image
from random import randint as rint
#import my other files:
import Adjacency
import WeightedMean

#width/length of grid:
x_grid = 200
y_grid = 200

#max/min height:
min_height = 0
max_height = 500

#number of refrence points:
num_refrence_points = 50

#Special generation chance
specialGen = (1 == rint(1,1000))





grid = []
#algorithm for creating grid to said dimensions:
for i in range(x_grid):
  temp = []
  for i in range(y_grid):
    temp.append(0)
  grid.append(temp)
  del temp
#Check:
print("Pre-calculation grid: ")
print(grid)
print()
 
#GENERATE REFRENCE POINTS
"""
refrenceValues = [rint(min_height,max_height), rint(min_height,max_height), rint(min_height,max_height), rint(min_height,max_height), rint(min_height,max_height), rint(min_height,max_height), rint(min_height,max_height), rint(min_height,max_height), rint(min_height,max_height)]
refrenceLocations = [[1,1],[1,25],[1,48],[25,1],[25,25],[25,48],[48,1],[48,25],[48,48]]
"""
refrenceValues = []
refrenceLocations = []
for i in range(num_refrence_points):
  refrenceValues.append(rint(min_height,max_height))
  refrenceLocations.append([rint(2,x_grid - 3),rint(2, y_grid - 3)])

print("refrence points:")
print(refrenceValues)
print("refrence point locations:")
print(refrenceLocations)
print()


#The following variable can be swapped out with the other method ("Adjacency.heightMapGenerator()"):
generator = WeightedMean.heightMapGenerator() 


grid = generator.generate(grid, refrenceValues, refrenceLocations, specialGen)




#Just to visualize map
visualizationMultiplier = 3
if specialGen:
  visualizationMultiplier = 1

lowest = max_height
for x in range(len(grid)):
  for y in range(len(grid[x])):
    if grid[x][y] < lowest:
      lowest = grid[x][y]
print(lowest)
temp = []
for x in range(len(grid)):
  for y in range(len(grid[x])):
    temp.append(((grid[x][y] - lowest) * visualizationMultiplier,(grid[x][y] - lowest) * visualizationMultiplier,(grid[x][y] - lowest) * visualizationMultiplier))
    
  #print(grid[x])

#Make image
img = Image.new('RGB', (x_grid,y_grid))
img.putdata(temp)
img.save('map.png')

del temp

