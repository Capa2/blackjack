class Card
{
  StringList url = new StringList("red_back.png", "AC.png", "AD.png", "AH.png", "AS.png", "2C.png", "2D.png", "2H.png", "2S.png", "3C.png", "3D.png", "3H.png", 
    "3S.png", "4C.png", "4D.png", "4H.png", "4S.png", "5C.png", "5D.png", "5H.png", "5S.png", "6C.png", "6D.png", "6H.png", "6S.png", "7C.png", "7D.png", "7H.png", 
    "7S.png", "8C.png", "8D.png", "8H.png", "8S.png", "9C.png", "9D.png", "9H.png", "9S.png", "10C.png", "10D.png", "10H.png", "10S.png", "JC.png", "JD.png", 
    "JH.png", "JS.png", "QC.png", "QD.png", "QH.png", "QS.png", "KC.png", "KD.png", "KH.png", "KS.png"); // card file names from /data. 691px x 1056px.
  PImage imgsrc; // Complex img variable.
  int id, seq, value; 
  float x, y; 
  float w = 69; 
  float h = 105;
  boolean faceUp;
  char suit;

  Card(int _x, int _y, int _id, boolean _faceUp)
  { 
    imageMode(CENTER);
    x = _x;
    y = _y;
    id = _id;;
    seq = drawNum;
    value = getValue();
    faceUp = _faceUp;
    //println("CARD ID: ", id, " VALUE: ", value);
    ++drawNum;
    //println("DrawNum " + (drawNum-1) + " -> " + drawNum + ".");
  }

  void update()
  {
    if (faceUp) imgsrc = loadImage(url.get(id));
    else imgsrc = loadImage(url.get(0));
    image(imgsrc, x, y, w, h);
  }
  
  void splitValue()
  {
    player.points -= value;
    player.splitPoints += value;
  }

  int getValue()
  {
    //LIST:  C>D>H>S  CARDBACK-A-2-3-4-5-6-7-8-9-10-J-Q-K
    if     (id > 0  && id <= 4)   return 11;
    else if (id > 4  && id <= 8)  return 2;
    else if (id > 8  && id <= 12) return 3;
    else if (id > 12 && id <= 16) return 4;
    else if (id > 16 && id <= 20) return 5;
    else if (id > 20 && id <= 24) return 6;
    else if (id > 24 && id <= 28) return 7;
    else if (id > 28 && id <= 32) return 8;
    else if (id > 32 && id <= 36) return 9;
    else if (id > 36)             return 10;
    println("CARD ID NOT IDENTIFIED: NO VALUE ASSIGNED.");
    return 0;
  }
}
