var rng = RandomNumberGenerator.new()
#import my other files:
#import QuadGrid

#width/length of grid:
var x_grid = 50
var y_grid = 50

#max/min height:
var min_height = 0
var max_height = 80

#number of refrence points:
var num_refrence_points = 10

#Special generation chance
var specialGen = (1 == rng.randi_range(1,1000))

#water level
var water_level = 8


var grid = []
 
#GENERATE REFRENCE POINTS
var refrenceValues = []
var refrenceLocations = []

#The following variable can be swapped out with the other method ("Adjacency.heightMapGenerator()"):
var temp = 0;



var highest = min_height

func _ready():
	rng.randomize()
#algorithm for creating grid to said dimensions:
	for _i in range(x_grid):
		temp = [0] * y_grid
		grid.append(temp)
		temp = null
	for _i in range(num_refrence_points):
		refrenceValues.append(rng.randi_range(min_height,max_height))
		refrenceLocations.append([rng.randi_range(2,x_grid - 3),rng.randi_range(2, y_grid - 3)])

	grid = generate(grid, refrenceValues, refrenceLocations)
	grid = quadGrid(grid)
	for x in range(len(grid)):
		for y in range(len(grid[x])):
			if grid[x][y] > highest:
				highest = grid[x][y]

	for x in range(len(grid)):
		for y in range(len(grid[x])):
			grid[x][y] = highest - grid[x][y]
			grid[x][y] -= water_level

func generate(grid_empty, values, locations):
	if specialGen == true:
		return
	var another_grid = grid_empty
	for i in locations:
		i[0] = len(grid_empty) - i[0] - 1
		i[1] = len(grid_empty[0]) - i[1] - 1

	for x in range(len(grid_empty)):
		for y in range(len(grid_empty[x])):

			var distanceFromPoints = []
			for i in locations:
				distanceFromPoints.append([abs(i[0] - x), abs(i[1] - y)])

			var total = 0
			var count = 1
			for i in range(len(distanceFromPoints)):
				temp = (distanceFromPoints[i][0] * distanceFromPoints[i][0]) + (distanceFromPoints[i][1] * distanceFromPoints[i][1])
				if specialGen:
					if temp < 1000:
						total += temp * temp * temp * values[i]
						count += temp * temp * temp
					else:
						total += temp * temp * temp * values[i]
						count += temp * temp * temp

			another_grid[x][y] = int(total/count)

	return another_grid

func rotate(qgrid):
	var new_arr = []
	for i in range(len(qgrid[0])):
		var row = []
		for j in range(len(qgrid)):
			row.append(qgrid[len(qgrid) - j - 1][i])
		new_arr.append(row)
	return new_arr
#temp = [[grid[j][i] for j in range(len(grid))] for i in range(len(grid[0])-1,-1,-1)]

func reflect(qgrid):
	var gridR = []
	temp = []

	for y in range(len(qgrid[0])):
		temp = []
		for x in range(len(qgrid)):
			temp.append(qgrid[x][y])
		gridR.append(temp)
		temp = null

	return gridR

func quadGrid(qgrid):
#FIND SIDE TOTALS
#sides = [right, bottom, left, top]
	var sides = []
	temp = 0
	for x in range(len(qgrid[len(qgrid) - 1])):
		temp += qgrid[x][0]
	sides.append(temp)
	temp = null
	temp = 0
	for y in range(len(qgrid)):
		temp += qgrid[0][y]
	sides.append(temp)
	temp = null
	temp = 0
	for x in range(len(qgrid[0])):
		temp += qgrid[x][len(qgrid) - 1]
	sides.append(temp)
	temp = null
	temp = 0
	for y in range(len(qgrid)):
		temp += qgrid[len(qgrid) - 1][y]
	sides.append(temp)
	temp = null
#IDENTIFY HIGHEST PAIR OF SIDES
	temp = 0
	var highPair = 0
	for side in range(len(sides)):
		if side == 3:
			if sides[3] + sides[0] > temp:
				temp = sides[3] + sides[0]
				highPair = side
		else:
			if sides[side] + sides[side + 1] > temp:
				temp = sides[side] + sides[side + 1]
				highPair = side


#SET ORIENTATION to quadrant II
	for _i in range(highPair):
		qgrid = rotate(qgrid)
#CREATE BOTTOM RIGHT QUADRANT
	var qgridiv = rotate(rotate(qgrid))
#CREATE BOTTOM LEFT QUADRANT
	var qgridiii = rotate(reflect(qgrid))
#CREATE TOP RIGHT QUADRANT
	var qgridi = rotate(rotate(rotate(reflect(qgrid))))


#combine qgrids:
	for x in range(len(qgridi)):
		temp = qgridi[x]
		qgrid[x]+=temp
		temp = null
	for x in range(len(qgridiii)):
		temp = qgridiv[x]
		qgridiii[x]+=temp
		temp = null
	qgrid+=qgridiii


#if qgrid[int(len(qgrid) / 2)][int(len(qgrid) / 2)] <
	return qgrid
