GridManager gridManager;

void setup()
{
  size(1000, 800);
  colorMode(HSB);
  strokeWeight(1);
  gridManager = new GridManager();
  CreateNewGrid();
}

void CreateNewGrid()
{
  background(0);
  gridManager.initiate(floor(random(1, 10)), floor(random(1, 10)), random(10, 110), random(10, 100), random(10, 100), random(3, 50), random(3, 50));
  gridManager.display();
  gridManager.saveGrid();
}

void keyPressed()
{
  if (key=='n' || key=='N')
    CreateNewGrid();  
}

void draw()
{
}