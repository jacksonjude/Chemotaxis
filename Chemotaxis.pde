final int NUM_BACTERIA = 100;

ArrayList<Bacteria> bacteriaArray = new ArrayList<Bacteria>();
-void setup()
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

    int rgb = HSBtoRGB((float)(frameCount%100)/100.0, 1.0, 1.0);
    float red = (rgb>>16)&0xFF;
    float green = (rgb>>8)&0xFF;
    float blue = rgb&0xFF;
    bacteria.setColor(red, green, blue);

    bacteria.walk();
    bacteria.show();
  }
}

int HSBtoRGB(float hue, float saturation, float brightness)
{
  if (saturation == 0)
    return convert(brightness, brightness, brightness, 0);
  if (saturation < 0 || saturation > 1 || brightness < 0 || brightness > 1)
    throw new IllegalArgumentException();
  hue = hue - (float) Math.floor(hue);
  int i = (int) (6 * hue);
  float f = 6 * hue - i;
  float p = brightness * (1 - saturation);
  float q = brightness * (1 - saturation * f);
  float t = brightness * (1 - saturation * (1 - f));
  switch (i)
  {
  case 0:
    return convert(brightness, t, p, 0);
  case 1:
    return convert(q, brightness, p, 0);
  case 2:
    return convert(p, brightness, t, 0);
  case 3:
    return convert(p, q, brightness, 0);
  case 4:
    return convert(t, p, brightness, 0);
  case 5:
    return convert(brightness, p, q, 0);
  default:
    throw new InternalError("impossible");
  }
}

int convert(float red, float green, float blue, float alpha)
{
  if (red < 0 || red > 1 || green < 0 || green > 1 || blue < 0 || blue > 1 || alpha < 0 || alpha > 1)
    throw new IllegalArgumentException("Bad RGB values");
  int redval = Math.round(255 * red);
  int greenval = Math.round(255 * green);
  int blueval = Math.round(255 * blue);
  int alphaval = Math.round(255 * alpha);
  return (alphaval << 24) | (redval << 16) | (greenval << 8) | blueval;
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

  void setColor(float red, float green, float blue)
  {
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

    x += ((Math.random()*6*xMult)-(3/xMult));
    y += ((Math.random()*6*yMult)-(3/yMult));
  }

  void show()
  {
    fill(red, green, blue);
    ellipse(x, y, 5, 5);
  }
}
