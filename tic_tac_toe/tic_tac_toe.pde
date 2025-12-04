Board aBoard;
boolean gameStateOver = false;

void settings(){
  size(boardSize, boardSize);
}

void setup(){
  aBoard = new Board();
  
  println("[ WELCOME TO TIK-TAC-TOE.] \n\n[ * THE COMPUTER ALWAYS STARTS AND PLAYS X BY DEFAULT. * ]");
  
  aBoard.computerTurn();
}

void draw(){
  background(boardColor);
  aBoard.drawBoard();
}

void keyPressed(){
  
  if (gameStateOver == true) {
    println("[ THE GAME IS OVER. NO MORE MOVES ARE PERMITTED. ]");
    return;
  }
  
  if (key >= '0' && key <= '8'){
    int index = key - '0';
    
    if (aBoard.isCellEmpty(index)){
      
      aBoard.placeMark(index, oMark);
      
      if (aBoard.checkWinCombination(oMark)){
        println("[ THE USER (O) WINS THE MATCH. ]");
        gameStateOver = true;
        return;
      }
      
      aBoard.computerTurn();
      
      if (aBoard.checkWinCombination(xMark)){
        println("[ THE COMPUTER (X) WINS THE MATCH. ]");
        gameStateOver = true;
        return;
      }
      
      if (aBoard.isBoardFull()){
        println("[ THE GAME IS A STALEMATE, THERE IS NO WINNER. ] ");
        gameStateOver = true;
        return;
      }
      
      println("[ GAME IS STILL ACTIVE ]");
      
    } else {
      println("[ CELL HAS ALREADY BEEN PLAYED. ]");
    } 
  } else {
      println("[ INVALID KEY SELECTION. ENTER A CELL NUMBER (0 - 8) ONLY. ]");
    }
  }
