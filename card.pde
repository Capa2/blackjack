class Card
{
  PImage imgsrc;
  int id, value;
  char suit;
  float x, y;
  float w = 69; // card images: 691px x 1056px.
  float h = 105;
  boolean visible = true;
  boolean pHand;
  
  Card(int i, boolean inPlayerHand, boolean vis)
  { 
    imageMode(CENTER);
    visible = vis;
    id = i;
    place(inPlayerHand);
    pHand = inPlayerHand;
    ++drawNum;
    //debug();

  }

  void update()
  {
    if(visible) imgsrc = loadImage(cardUrl.get(id));
    else imgsrc = loadImage(cardUrl.get(0));
    image(imgsrc, x, y, w, h);
  }
  void place(boolean inPlayerHand)
  {
    if(inPlayerHand)
      {
        ++pCardCount;
        y = height - h * 1;
        x = (width/5)*pCardCount;
      }
      else
      {
        ++dCardCount;
        y = 0 + h * 1;
        x = (width/5)*dCardCount;
      }
  }
  int getValue()
  {
    //LIST:  C>D>H>S  CARDBACK-A-2-3-4-5-6-7-8-9-10-J-Q-K
    if     (id > 0  && id <= 4)  return 11;
    else if(id > 4  && id <= 8)  return 2;
    else if(id > 8  && id <= 12) return 3;
    else if(id > 12 && id <= 16) return 4;
    else if(id > 16 && id <= 20) return 5;
    else if(id > 20 && id <= 24) return 6;
    else if(id > 24 && id <= 28) return 7;
    else if(id > 28 && id <= 32) return 8;
    else if(id > 32 && id <= 36) return 9;
    else if(id > 36)             return 10;
    println("CARD ID NOT IDENTIFIED: NO VALUE ASSIGNED.");
    return 0;
  }
  void testCall()
  {
  println("Succesful Method call.");
  }
  void debug()
  {
    x = round(width/3+drawNum*w);
    y = round(height/2);
    //println(drawNum + " object(s) created. New ID: " + id + " IMG: " + cardUrl.get(id));  
  }
}
