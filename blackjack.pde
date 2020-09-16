void setup()
{
  size(420, 640);
  frameRate(60);
  shuffleCards();
  round = 0;
  gameStage();
  
}

void draw()
{
  ui();
  if(advance)
  {
    gameStage();
    advance = false;
  }
  drawCardGraphics();
}
