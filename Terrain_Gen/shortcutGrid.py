class island:

  def __init__(self):
    x = 0
    del x

    #ROTATES GRID 90 DEGREES COUNTER-CLOCKWISE
  def rotate(self,grid):
    return [[grid[j][i] for j in range(len(grid))] for i in range(len(grid[0])-1,-1,-1)]

  #REFLECTS GRID OVER Y = -X
  def reflect(self,grid):    
    gridR = []

    for y in range(len(grid[0])):
      temp = []
      for x in range(len(grid)):
        temp.append(grid[x][y])

      gridR.append(temp)
      del temp

    return gridR


  def quadGrid(self, grid):
    #FIND SIDE TOTALS
    #sides = [right, bottom, left, top]
    sides = []
    temp = 0
    for x in range(len(grid[len(grid) - 1])):
      temp += grid[x][0]
    sides.append(temp)
    del temp
    temp = 0
    for y in range(len(grid)):
      temp += grid[0][y]
    sides.append(temp)
    del temp
    temp = 0
    for x in range(len(grid[0])):
      
      temp += grid[x][len(grid) - 1]
    sides.append(temp)
    del temp
    temp = 0
    for y in range(len(grid)):
      
      temp += grid[len(grid) - 1][y]
    sides.append(temp)
    del temp

    #IDENTIFY HIGHEST PAIR OF SIDES
    temp = 0
    highPair = 0
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
    for i in range(highPair):
      grid = self.rotate(grid)
    #CREATE BOTTOM RIGHT QUADRANT
    gridiv = self.rotate(self.rotate(grid))
    #CREATE BOTTOM LEFT QUADRANT
    gridiii = self.rotate(self.reflect(grid))
    #CREATE TOP RIGHT QUADRANT
    gridi = self.rotate(self.rotate(self.rotate(self.reflect(grid))))



    #combine grids:
    for x in range(len(gridi)):
      temp = gridi[x]
      grid[x].extend(temp)
      del temp
    for x in range(len(gridiii)):
      temp = gridiv[x]
      gridiii[x].extend(temp)
      del temp
    grid.extend(gridiii)

  
    #if grid[int(len(grid) / 2)][int(len(grid) / 2)] < 




    
    return grid
