class heightMapGenerator:
  def __init__ (self):
    print("successful initialization of object")
    
  def generate(self, grid, refrenceValues, refrenceLocations, specialGen = False):

    for i in refrenceLocations:
      i[0] = len(grid) - i[0] - 1
      i[1] = len(grid[0]) - i[1] - 1


    

    #FOR LOOPS FOR X AND Y
    for x in range(len(grid)):
      for y in range(len(grid[x])):
        
      #CALCULATE DISTANCE FROM EACH REFRENCE POINT TO CURRENT POSITION
        distanceFromPoints = []
        farthest_x = 0
        farthest_y = 0
        
        for i in refrenceLocations:
          distanceFromPoints.append([abs(i[0] - x), abs(i[1] - y)])


      #MULTIPLY NEW DISTANCE VALUES WITH REFRENCE POINT HEIGHT
        total = 0
        count = 1
        for i in range(len(distanceFromPoints)):
          temp = (distanceFromPoints[i][0] * distanceFromPoints[i][0]) + (distanceFromPoints[i][1] * distanceFromPoints[i][1])
          #The following line makes the affected radius of each reference point painfully obvious (one in a thousand chance):
          if specialGen:
            if temp < 5000:
              total += temp * temp * refrenceValues[i]
              count += temp * temp
          else:
            total += temp * temp * refrenceValues[i]
            count += temp * temp

      #DIVIDE BY COUNT
        grid[x][y] = int(total/count)

    return grid

      #CELEBRATE

      #DEBUG
      #Be depressed while doing so

      #repeat last 3 steps until someone effectively convinces me to stop