void setup()
{
  size(420, 640);
  frameRate(30);
  createLists();
  //dealer.round1();
  round = 0;
  bet = 0;
}

void draw()
{
  background(pokerGreen[0],pokerGreen[1],pokerGreen[2]);
  dealer.update();
  ui();
}
