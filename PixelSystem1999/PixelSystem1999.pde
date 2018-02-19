// PixelSystem1999 pseudo recode + variation
// by zproc - xt10.20zp9 (at) gmail - 2015

// Nota: Sorry about the single or two letters var names etc.

static final float chance = 3.5;
static final int mincFinal = 4;
static final int glyphSize = 65;

int minc = mincFinal;

void setup()
{
  size(550, 630);
  
  strokeCap(PROJECT);
  strokeJoin(MITER);
  ellipseMode(CORNER);
  
  frameRate(1);
}


void draw()
{ 
  stroke(0);
  fill(0);
  rect(0, 0, width, height);
    
  int mx = glyphSize - minc * 2; //init glypth/square/circle size
  
  for (int i=0; i<3; i++)
  for (int j=0; j<=10; j++)
  {
    pushMatrix();
    
      translate(i*70+width/3, j*70);
    
      strokeWeight(1); stroke(255); fill(255); 
      
      // lines around the big squares/circles
      if(chance*2<random(10))
      {
        rect(mx/2+minc+2, 4, 4, 2); // top
        rect(mx/2+minc+2, mx+10, 4, 2); // bottom
        
        rect(4, (mx+20)/2-2, 2, 4); // left
        rect(10+mx, (mx+20)/2-2, 2, 4); // right
      }
      
      // iterate for squares inside squares (or circles)
      for (int m=0; m<4; m++)
      {
        pushMatrix();
       
          translate(4+minc, 4+minc);
          
          //draw one square (or circle)
          drawGlyph(0, 0, mx);
          
        popMatrix();
          
        minc+=minc; // increment margin/padding between glyphs/squares/circles
        mx-=minc;  // decrement size of the glyph/square/circle
      }
      minc = mincFinal; // reinit margin/padding
      mx = glyphSize-minc*2; // reinit glypth/square/circle size
      
    popMatrix();
  }
}


void drawGlyph(int i, int j, int size) 
{
    theLooksOrTheLifestyle();
    
    if(chance<random(10)) 
      ellipse(0, 0, size, size);
    else 
      rect(0, 0, size, size);
}


void theLooksOrTheLifestyle()
{
  strokeWeight(3);
  if(chance<random(10)) 
    fill(0);         
  else 
    fill(255); 
    
  if(chance<random(10))
    stroke(0);        
  else 
    stroke(255);
}


// Same function as the one above but not strictly black&white
// didn't take time apparently to finish tweaking transparency (+ another thing) to make it better

/*
void theLooksOrTheLifestyleButNotInBlackAndWhite() 
{
  strokeWeight(3);
  if(chance<random(10)) 
    fill(0, 170); 
  else 
    fill(255, 75); 
    
  if(chance<random(10)) 
    stroke(0, 170); 
  else 
    stroke(255, 75); 
  
}*/
