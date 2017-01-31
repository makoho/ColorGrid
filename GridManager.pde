class GridManager {

  ArrayList<GridCell> cells = new ArrayList<GridCell>();
  float topMargin;
  float bottomMargin;
  float horizontalMargin;
  float verticalInterval;
  float horizontalInterval;

  public GridManager() 
  {
  }

  void initiate(PVector cellSize, int rowCount, int columnCount)
  {
    cells.clear();
    
    horizontalInterval = (width - columnCount * cellSize.x) / (columnCount + 2);
    horizontalMargin   = horizontalInterval * 1.5;

    verticalInterval   = (height - rowCount * cellSize.y) / (rowCount + 2);
    topMargin          = verticalInterval * 1.5;
    bottomMargin       = verticalInterval * 1.5;

    for (int c=0; c<columnCount; c++)
    {
      for (int r=0; r<rowCount; r++)
      {
        PVector cellLocation = new PVector(horizontalMargin + c * (horizontalInterval + cellSize.x), 
          topMargin + r * (verticalInterval + cellSize.y));
        cells.add(new GridCell(cellLocation, cellSize));
      }
    }
  }

  void initiate(int _rowCount, int _columnCount, float _topMargin, float _bottomMargin, float _horizontalMargin, float _verticalInterval, float _horizontalInterval)
  {
    cells.clear();
    
    horizontalMargin   = _horizontalMargin;
    topMargin          = _topMargin;
    bottomMargin       = _bottomMargin;
    verticalInterval   = _verticalInterval;
    horizontalInterval = _horizontalInterval;

    float cellWidth = floor((width - (2 * horizontalMargin) - ((_columnCount - 1) * horizontalInterval)) / _columnCount);
    float cellHeight = floor((height - (topMargin + bottomMargin) - ((_rowCount - 1) * verticalInterval)) / _rowCount);

    for (int c=0; c<_columnCount; c++)
    {
      for (int r=0; r<_rowCount; r++)
      {
        PVector cellLocation = new PVector(horizontalMargin + c * (horizontalInterval + cellWidth), 
          topMargin + r * (verticalInterval + cellHeight));
        cells.add(new GridCell(cellLocation, new PVector(cellWidth, cellHeight)));
      }
    }
  }


  void display()
  {
    //loadPixels();
    for (GridCell c : cells)
    {
      c.display();
    }
    //updatePixels();
  }
  
  void saveGrid()
  {
    save("\\grids\\" + nf(year(), 4) + nf(month(), 2) + nf(day(), 2) + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2) + nf(millis(), 2) + ".png");
  }
}