float aBrush = 0.001;

class Brush {
  int res;
  color[] colorVal;
  int numBands;
  float bandWidth;
  float[] bandStart;
  color[] bandColor;
  float t;
  
  Brush( int resIn ,  int numBandsIn , float bandWidthIn ) {
    this.res = resIn;
    this.numBands = numBandsIn;
    this.bandWidth = bandWidthIn;
    this.bandStart = new float[numBands];
    this.bandColor = new color[numBands];
    for( int i = 0 ; i < numBands ; i++ ) {
      float a  = float(i) / float(numBands);
      bandStart[i] = a;
      bandColor[i] = hsbColor( a*360 , 1 , 1 );
      println( a*360);
    }
    this.t = 0;
    this.colorVal = new color[res];

  }
  
  void evolve( float dt ) {
    this.t += dt;
    for( int i = 0 ; i < res ; i++ ) {
      float a = noise( float(i)*aBrush , t );
      boolean colorDone = false;
      for( int j = 0 ; j < numBands ; j++ ) {
        if( a >= bandStart[j] && a <= bandStart[j] + bandWidth ) {
          colorVal[i] = bandColor[j];
          colorDone = true;
        }
      }
      if( !colorDone ) {
        colorVal[i] = color(0);
      }
    }
  }
}