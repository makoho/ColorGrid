class GridCell {

  PVector location;
  PVector size;

  float hue;
  float saturation;
  float brightness;

  float hueNoiseSeed = random(0, 100);
  float saturationNoiseSeed = random(100, 200);
  float brightnessNoiseSeed = random(200, 300);

  float hSeedDelta = 1;
  float sSeedDelta = 1.5;
  float bSeedDelta = 1;

  public GridCell(PVector _location, PVector _size)
  {
    location = _location;
    size = _size;
  }

  void display()
  {       
    hue = random(0, 255);
    saturation = random(100, 145);
    brightness = random(0, 255);

    int cornerOffset = 0;

    for (int y=floor(location.y); y<floor(location.y)+floor(size.y); y++)
    {
      if (y==floor(location.y) || y==floor(location.y) + floor(size.y) - 1)
      {
        cornerOffset = 1;
      } else
      {
        cornerOffset = 0;
      }

      stroke(color(hue, saturation, brightness));
      line(location.x + cornerOffset, y, location.x + size.x - cornerOffset, y);
      UpdateColor(); 
    }
  }

  void UpdateColor()
  {
  
      hue += noise(hueNoiseSeed);
      saturation += noise(saturationNoiseSeed) - 0.5;
      brightness += (noise(brightnessNoiseSeed)) ;

      hue = constrain(hue, 0, 255);
      saturation = constrain(saturation, 0, 255);
      brightness = constrain(brightness, 0, 255);

      hueNoiseSeed += hSeedDelta;
      saturationNoiseSeed += sSeedDelta;
      brightnessNoiseSeed += bSeedDelta;
    
  }
}