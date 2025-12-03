void drawXMark(float xCenterCoordinate, float yCenterCoordinate, float cellSize){
  stroke(markColor);
  strokeWeight(10);
  float markSpaceOffset = (cellSize * 0.3);
  line(xCenterCoordinate - markSpaceOffset, yCenterCoordinate - markSpaceOffset, xCenterCoordinate + markSpaceOffset, yCenterCoordinate + markSpaceOffset);
  line(xCenterCoordinate + markSpaceOffset, yCenterCoordinate - markSpaceOffset, xCenterCoordinate - markSpaceOffset, yCenterCoordinate + markSpaceOffset);
}

void drawOMark(float xCenterCoordinate, float yCenterCoordinate, float cellSize){
  stroke(markColor);
  noFill();
  strokeWeight(10);
  ellipse(xCenterCoordinate, yCenterCoordinate, (cellSize * 0.6), (cellSize * 0.6));
}
