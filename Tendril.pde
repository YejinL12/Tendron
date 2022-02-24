class Tendril
{
  public final static int SEG_LENGTH = 4; //length of each segment in the tendril
  private int myNumSegments, myX, myY;
  private double myAngle;

  /**
   Class constructor
   len is how many segments in this tendril (each a fixed length, 4 is a good start)
   theta is tendril starting angle in radians 
   x, y  is the starting (x,y) coordinate
   */
  public Tendril(int len, double theta, int x, int y)
  {
    myNumSegments = len;
    myX = x; 
    myY = y;
    myAngle = (float)theta;
  }
  public void show()
  { 
    
    if(SEG_LENGTH > 3){
      stroke(0,255,0);
    }else if(SEG_LENGTH > 1){
      stroke(0,150,0);
    }else{
      stroke (255,255,255);
    }
    stroke((float)Math.random()*255, (float)Math.random()*255, (float)Math.random()*255 );
    float startX = myX;
    float startY = myY;
    float endX = startX + (float)(Math.cos(myAngle)*SEG_LENGTH);
    float endY = startY + (float)(Math.sin(myAngle)*SEG_LENGTH);
    for (int i = 0; i <= myNumSegments; i++) {
      myAngle += (float)(Math.random()*0.5)-0.3;
       endX = startX + (float)(Math.cos(myAngle)*SEG_LENGTH);
       endY = startY + (float)(Math.sin(myAngle)*SEG_LENGTH);
      line(startX, startY, endX, endY);
      startX = endX;
      startY = endY;
      
    }
    if (myNumSegments >= 3) {
      Cluster Joe = new Cluster(myNumSegments/4, (int)endX, (int)endY);
    }
  }
}
