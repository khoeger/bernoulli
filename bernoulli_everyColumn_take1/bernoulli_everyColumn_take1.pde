/*
  Katarina Hoeger
 May 2021
 
 Bernoulli Distribution
 
 every pixel bernoulli
 
 Bernoulli:
 f(x) = {   1 - p, x = 0
 p,     x = 1
 */

float pValue;
Boolean isItTrueOrFalse;

void setup() {
  size(100, 100);

  stroke(0,100);
  strokeWeight(1);
}

void draw() {
  background(255);
  bernoulli(0.5);

  // loop across columns
  for ( int xVal = 0; xVal <= width; xVal++) {
    pValue = xVal/float(100);
    // loop across rows
    for ( int yVal = 0; yVal <= height; yVal++) {
      
      isItTrueOrFalse = bernoulli(pValue);
      paintIfTrue(isItTrueOrFalse, xVal, yVal);
    }
  }

  noLoop();
}

void paintIfTrue(Boolean trueFalse, float _x, float _y ) {
  /* 
   If given true, paint
   */
  if (trueFalse == true) {
    point(_x, _y);
  }
}

Boolean bernoulli( float _p ) {
  /*  
   Given probability p (0<=p<=1),
   - compute random number x in (0,1)
   - if x <= p, return true
   - else, return false
   */
  float randomNumber = random(1);
  if (randomNumber <= _p ) {
    return(true);
  } else {
    return(false);
  }
}
