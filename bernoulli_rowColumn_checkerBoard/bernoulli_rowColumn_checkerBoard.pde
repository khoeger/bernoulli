/*
  Katarina Hoeger
 May 2021
 
 Bernoulli Distribution
 
 Make Bernoulli tiles, bernoulli dist. over rows of 100 or columns of 100
 Rows True. (Start stroke black, alpha 0, increase as go over rows?)
 Columns False. 
 
 Bernoulli:
 f(x) = {   1 - p, x = 0
 p,     x = 1
 
 - works best with odd * tileWH pixels
 - does not take conglomerate row p into account
 */

String filename = "Bernoulli_Checkerboard_rowCol_1100x1100_"+str(year())+str(month())+str(day())+".png";


float pValue;
Boolean isItTrueOrFalse;

int tileWH = 100;

BernoulliTile sampleTile, sampleTile2 ;
int numTiles;
int numRows, numCols;
BernoulliTile[][] tileArray;

float alphaPValue;

void setup() {
  size(1100, 1100);

  stroke(0);
  strokeWeight(1);

  rectMode(CORNER);


  numRows = ceil( height/100);
  numCols = ceil( width/100);

  numTiles = numRows * numCols;
  tileArray = new BernoulliTile[ numRows ][numCols];

  Boolean nextTileType = false;
  for (int row = 0; row < numRows; row ++) {
    for (int col = 0; col < numCols; col ++) {

      tileArray[row][col] = new BernoulliTile( nextTileType, 0.5);
      nextTileType = !nextTileType;
    }
  }
}

void draw() {
  background(255);

  for (int row = 0; row < numRows; row ++) {
    for (int col = 0; col < numCols; col ++) {


      tileArray[row][col].placeTile(col*tileWH, row*tileWH);
    }
  }


  noLoop();
  save(filename);
}



class BernoulliTile { 
  float x, y; // top left corner
  Boolean tF;
  float p;    // tile's pValue

  BernoulliTile( Boolean _trueOrFalse, float _p) {
    this.tF = _trueOrFalse;
    this.p = _p;
  }

  void display() {
    // unnecessary?
  }

  void placeTile( float tileX, float tileY ) {
    /* place the tile at a certain x, y upper left*/
    push();
    translate(tileX, tileY);
    this.looper();
    pop();
  }

  void looper() {
    /* If true, loop across columns.
     If false, loop across rows
     */
    if (this.tF == true) {
      // loop over columns
      for ( int xVal = 0; xVal <= tileWH; xVal++) {
        pValue = xVal/float(100);
        // loop across rows
        for ( int yVal = 0; yVal <= tileWH; yVal++) {

          isItTrueOrFalse = this.bernoulli(pValue);
          this.paintIfTrue(isItTrueOrFalse, xVal, yVal);
        }
      }
    } else {
      // loop over rows

      for ( int xVal = 0; xVal <= tileWH; xVal++) {
        // loop across rows
        for ( int yVal = 0; yVal <= tileWH; yVal++) {

          pValue = yVal/float(100);
          isItTrueOrFalse = this.bernoulli(pValue);
          this.paintIfTrue(isItTrueOrFalse, xVal, yVal);
        }
      }
    }
  }

  void paintIfTrue(Boolean _trueOrFalseIn, float _xIn, float _yIn ) {
    /* 
     If given true, paint
     */
    if (_trueOrFalseIn == true) {
      point(_xIn, _yIn);
    }
  }


  Boolean bernoulli( float _pIn ) {
    /*  
     Given probability p (0<=p<=1),
     - compute random number x in (0,1)
     - if x <= p, return true
     - else, return false
     */
    float randomNumber = random(1);
    if (randomNumber <= _pIn ) {
      return(true);
    } else {
      return(false);
    }
  }
}
