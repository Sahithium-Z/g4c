#from PIL import Image
from random import randint as rint
#import my other files:
import WeightedMean
#import QuadGrid
import shortcutGrid


#width/length of grid:
x_grid = 50
y_grid = 50

#max/min height:
min_height = 0
max_height = 80

#number of refrence points:
num_refrence_points = 10

#Special generation chance
specialGen = (1 == rint(1,1000))

#water level
water_level = 8


grid = []
#algorithm for creating grid to said dimensions:
for i in range(x_grid):
  temp = [0] * y_grid
  grid.append(temp)
  del temp
#Check:
#print("Pre-calculation grid: ")
#print(grid)
#print()
 
#GENERATE REFRENCE POINTS
refrenceValues = []
refrenceLocations = []
for i in range(num_refrence_points):
  refrenceValues.append(rint(min_height,max_height))
  refrenceLocations.append([rint(2,x_grid - 3),rint(2, y_grid - 3)])

#print("refrence points:")
#print(refrenceValues)
#print("refrence point locations:")
#print(refrenceLocations)
#print()


#The following variable can be swapped out with the other method ("Adjacency.heightMapGenerator()"):
generator = WeightedMean.heightMapGenerator() 
assembler = shortcutGrid.island()


grid = generator.generate(grid, refrenceValues, refrenceLocations, specialGen)

#replace parameter with following when using QuadGrid.py : [generator.generate(temp, refrenceValues, refrenceLocations, specialGen)] * 4
grid = assembler.quadGrid(grid)


highest = min_height
for x in range(len(grid)):
  for y in range(len(grid[x])):
    if grid[x][y] > highest:
      highest = grid[x][y]

for x in range(len(grid)):
  for y in range(len(grid[x])):
    grid[x][y] = highest - grid[x][y]
    grid[x][y] -= water_level





#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#END OF ACTUAL CODE
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#THE REST IS JUST FOR VISUALIZING THE GRID


















#Visualize map
"""
lowest = max_height
for x in range(len(grid)):
  for y in range(len(grid[x])):
    if grid[x][y] < lowest:
      lowest = grid[x][y]
      
print(lowest)

#the next ~8 lines are for making it use the full spectrum of 0 to 255
highest = min_height
for x in range(len(grid)):
  for y in range(len(grid[x])):
    if grid[x][y] > highest:
      highest = grid[x][y]
print(highest)
print("Range:")
print(highest - lowest)
visualizationMultiplier = int(255 / (highest - lowest))

if specialGen:
  visualizationMultiplier = 1

temp = []
for x in range(len(grid)):
  for y in range(len(grid[x])):
    temp.append(((grid[x][y] - lowest) * visualizationMultiplier,(grid[x][y] - lowest) * visualizationMultiplier,(grid[x][y] - lowest) * visualizationMultiplier))
    
  #print(grid[x])

#Make image
img = Image.new('RGB', (x_grid * 2,y_grid * 2))
img.putdata(temp); del temp
img.save('map.png')
"""
