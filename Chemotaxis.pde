//declare bacteria variables here
final int NUM_BACTERIA = 100;
ArrayList<Bacteria> bacteriaArray = new ArrayList<Bacteria>();
void setup()
{
  size(300, 300);
  for (int i = 0; i < NUM_BACTERIA; i++)
  {
    bacteriaArray.add(new Bacteria(width/2, height/2));
  }
	//initialize bacteria variables here
}
void draw()
{
	//move and show the bacteria
  background(204);
  for (int i = 0; i < bacteriaArray.size(); i++)
  {
    Bacteria bacteria = bacteriaArray.get(i);
    bacteria.walk();
    bacteria.show();
  }
}
class Bacteria
{
  float x;
  float y;

  Bacteria(float x, float y)
  {
    this.x = x;
    this.y = y;
  }

  void walk()
  {
    //x += (Math.random()*6) - 3;
    //y += (Math.random()*6) - 3;

    int xMult = (mouseX - x > 0) ? 1 : -1;
    int yMult = (mouseY - y > 0) ? 1 : -1;

    x += ((Math.random()*6)+3) * xMult;
    y += ((Math.random()*6)+3) * yMult;
  }

  void show()
  {
    fill(255, 0, 0);
    ellipse(x, y, 5, 5);
  }
	//lots of java!
}
