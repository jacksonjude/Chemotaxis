final int NUM_BACTERIA = 100;

ArrayList<Bacteria> bacteriaArray = new ArrayList<Bacteria>();
void setup()
{
  size(300, 300);
  for (int i = 0; i < NUM_BACTERIA; i++)
  {
    bacteriaArray.add(new Bacteria(width/2.0, height/2.0, (float)Math.random()*255, (float)Math.random()*255, (float)Math.random()*255));
  }
}
void draw()
{
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
  float red, green, blue;

  Bacteria(float x, float y, float red, float green, float blue)
  {
    this.x = x;
    this.y = y;
    this.red = red;
    this.green = green;
    this.blue = blue;
  }

  void walk()
  {
    //x += (Math.random()*6) - 3;
    //y += (Math.random()*6) - 3;

    float speed = 1.2;

    float xMult = (mouseX - x > 0) ? speed : -speed;
    float yMult = (mouseY - y > 0) ? speed : -speed;

    x += ((Math.random()*6*xMult)-(3*(1/xMult)));
    y += ((Math.random()*6*yMult)-(3*(1/yMult)));
  }

  void show()
  {
    fill(red, green, blue);
    ellipse(x, y, 5, 5);
  }
}
