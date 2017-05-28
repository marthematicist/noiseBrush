Brush B;
float pos = 0;
int shiftAmt = 5;

void setup() {
  size( 800 , 480 );
  background( 0 );
  noStroke();
  B = new Brush( 400 , 40 , 0.006 );
}



void draw() {
  loadPixels();
  for( int x = width-1 ; x >= shiftAmt ; x-- ) {
    for( int y = 0 ; y < height ; y++ ) {
      pixels[y*width+x] = pixels[y*width+x-shiftAmt];
    }
  }
  updatePixels();
  
  //pos = 0;
  for( int y = 0 ; y < shiftAmt ; y++ ) {
    B.evolve( 0.004 );
    
    pos++;
    pos %= width;
    
    for( int i = 0 ; i < B.res ; i++ ) {
      fill( B.colorVal[i] );
      //stroke( B.colorVal[i] );
      rect( shiftAmt - y , float(i)/float(B.res)*height , 1 , 2 );
    }
    
    if( frameCount % 100 == 0 ) {
      println( frameRate );
    }
  } 
}