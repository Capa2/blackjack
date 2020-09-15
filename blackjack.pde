void setup()
{
  size(420, 640);
  frameRate(60);
  createLists();
  round = 0;
  advance = false;
  gameStage();
  
}

void draw()
{
  bg();
  if(advance)
  {
    gameStage();
    advance = false;
  }
  drawCardGraphics();
  ui();
}

void gameStage()
{
  if (round == 0)
  {
    println("Round 0");
    drawNum = 0;
    player.canBet = true;
  }
  if (round == 1)
  {
    println("Round 1");
    player.getCard();
    dealer.getCard();
    player.getCard();
    dealer.getCard();
    
    player.canBet = false;
    player.canHit = true;
    player.canStand = true;
    player.canSplit = true;
    player.canDouble = true;
    player.canIns = true;
  }
  if (round == 2)
  {
    println("Round 2");
    player.canBet = false;
    player.canHit = true;
    player.canStand = true;
    player.canSplit = false;
    player.canDouble = false;
    player.canIns = false;
  }
  if (round == 3)
  {
    println("Round 3");
    player.canBet = false;
    player.canHit = false;
    player.canStand = false;
    player.canSplit = false;
    player.canDouble = false;
    player.canIns = false;
  }
}
