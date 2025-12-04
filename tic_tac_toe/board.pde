class Board {
  int[] cells = new int [cellCount];
  
  Board(){
    for (int i = 0; i < cellCount; i++){
      cells[i] = emptyCell;
    }
  }
  void drawBoard(){
    drawGrid();
    drawMarks();
  }
  
  void drawGrid(){
    stroke(gridColor);
    strokeWeight(6);
    
    line(cellSize, 0, cellSize, boardSize);
    line(cellSize * 2, 0, cellSize * 2, boardSize);
    
    line(0, cellSize, boardSize, cellSize); 
    line(0, cellSize * 2, boardSize, cellSize * 2);
  }
  
  drawPlayerMark(){
    for (int i = 0; i < cellCount; i++){
      float xCoordinate = (i % 3) * cellSize;
      float yCoordinate = floor(i/3) * cellSize;
      
      float xCenterCoordinate = (xCoordinate + cellSize / 2);
      float yCenterCoordinate = (yCoordinate + cellSize / 2); 
      
      if (cells[i] == xMark){
        drawXMark(xCenterCoordinate, yCenterCoordinate, cellSize);
      }
      else if(cells[i] == oMark){
        drawOMark(xCenterCoordinate, yCenterCoordinate, cellSize);
      }
    }
  }
  
  boolean isCellEmpty(int i){
    return cells[i] == emptyCell;
  }
  
  void placeMark(int i, int mark){
    cells[i] = mark;
  }
  
  void computerTurn(){
    for (int i = 0; i < cellCount; i++){
      if (isCellEmpty(i)){
        placeMark(i, xMark);
        println("[ Computer placed an X in cell " + i);
        return;
      }
    }
  }
  
  boolean checkWinCombination(int mark){
    int[][] wins = {{0,1,2}, {3,4,5}, {6,7,8}, {1,4,7}, {2,5,8}, {0,4,8}, {2,4,6}};
    
    for (int[] winLine : wins){
      if (cells[winLine[0]] == mark && cells[winLine[1]] == mark && cells[winLine[2]] == mark) {
        return true;
      }
    }
    return false;
  }
  
  boolean isBoardFull(){
    for(int i = 0; i < cellCount; i++){
      if (cells[i] == emptyCell){
      return false;
      }
    }
  }
}
