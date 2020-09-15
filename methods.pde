void keyPressed()
{
  player.bet();
  if (key == 'x') player.hit();
  if (key == 'c') player.stand();
  if (key == 'v') player.splitBet();
  if (key == 'z') player.doubleBet();
  if (key == 'q') setup();
}

void newCard(int x, int y, boolean faceUp)
{
  cards[drawNum] = new Card(x, y, shuffled.get(drawNum), faceUp);
}

void createLists()
{
  shuffled = new IntList();
  for (int i = 1; i <= 52; ++i)
  {
    shuffled.append(i);
  }
  shuffled.shuffle();
}

void drawCardGraphics()
{
  for (int i = 0; i < drawNum; ++i)
  {
    cards[i].update();
  }
}

void ui() 
{
  rectMode(CENTER);
  strokeWeight(1);
  textSize(18);
  textAlign(CENTER);
  text("(x) Hit  (c) Stand  (d) Double Down", width/2, height-225+12);
  text("(UP) +bet (DOWN) -bet  (q) Restart", width/2, height-200+12);
  text("$" + player.money + "  Bet: " + player.bet + "  Hand: " + player.points, width/2, height-250+12);
}

void bg()
{
  int[] whitish      = {166, 255, 214};
  int[] lighterGreen = {126, 242, 184};
  int[] lightGreen   = {93, 179, 136};
  int[] pokerGreen   = {53, 101, 77};
  int[] green        = {60, 115, 87};
  int[] darkGreen    = {40, 77, 58};
  background(pokerGreen[0], pokerGreen[1], pokerGreen[2]);
}
