/*
  Katarina Hoeger
 May 2021
 
 Bernoulli Distribution
 
 every pixel bernoulli
 
 Bernoulli:
 f(x) = {   1 - p, x = 0
 p,     x = 1
 */

float pValue = 0.5;
Boolean isItTrueOrFalse;

String filename = "Bernoulli__1000x1000_"+str(year())+str(month())+str(day())+".png";


void setup() {
  size(1000,1000);
  
  stroke(0);
  strokeWeight(1);
}

void draw() {
  background(255);
  bernoulli(0.5);
  
  // loop across columns
  for( int xVal = 0; xVal <= width ; xVal++){
    // loop across rows
    for ( int yVal = 0; yVal <= height; yVal++){
    isItTrueOrFalse = bernoulli(pValue);
    paintIfTrue(isItTrueOrFalse, xVal, yVal);
    }
  }
  
  noLoop();
  save(filename);
}

void paintIfTrue(Boolean trueFalse, float _x, float _y ){
  /* 
    If given true, paint
  */
  if (trueFalse == true){
    point(_x,_y);
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
