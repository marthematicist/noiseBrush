Brush B;
float pos = 0;

void setup() {
  size( 800 , 480 );
  background( 0 );
  noStroke();
  B = new Brush( 400 , 40 , 0.006 );
}

void draw() {
  for( int y = 0 ; y < 5 ; y++ ) {
  B.evolve( 0.004 );
  
  pos++;
  pos %= width;
  
  for( int i = 0 ; i < B.res ; i++ ) {
    fill( B.colorVal[i] );
    //stroke( B.colorVal[i] );
    rect( pos , float(i)/float(B.res)*height , 1 , 2 );
  }
  
  if( frameCount % 100 == 0 ) {
    println( frameRate );
  }
  } 
}