Brush B;
float pos = 0;

void setup() {
  size( 800 , 480 );
  background( 0 );
  noStroke();
  
  B = new Brush( 4000 , 20 , 0.025 );
}

void draw() {
  B.evolve( 0.001 );
  
  pos++;
  pos %= width;
  
  for( int i = 0 ; i < B.res ; i++ ) {
    fill( B.colorVal[i] );
    rect( pos , float(i)/float(B.res)*height , 1 , 1 );
  }
  
  if( frameCount % 100 == 0 ) {
    println( frameRate );
  }
  
}