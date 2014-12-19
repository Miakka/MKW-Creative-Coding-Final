
String lines[];
PFont thefont, themarkovfont;

int whichpage = 0;
String thefilename;


int textsize = 12;



int theframe = 0;
int frameflip = 30; // how many frames to wait until flip

kiaMarkov mc;

float x, y;

int WHATAREWEDOING = 0;


void setup()
{
  size(800, 600);
  frameRate(3);
  background(250);
  thefont = loadFont("Menlo-Regular-48.vlw");
  themarkovfont = loadFont("Avenir-Oblique-48.vlw");

  textFont(thefont);

  loadthepage(whichpage);

  x = 20;
  y = 30;

  String chapters[] = loadStrings("01.2008_cooked.txt");
  mc = new kiaMarkov(chapters);
}

void draw()
{


  if(WHATAREWEDOING==0) drawmarkov();
  else if (WHATAREWEDOING==1) drawstraight();

  theframe = theframe + 1;
  println(theframe);
  if (theframe>=frameflip) {
    if (WHATAREWEDOING==0) // flip from normal to markov
    {
      WHATAREWEDOING = 1;
      x = 20;
      y = 30;
      background(250);
      theframe = 0;
    } 
    else 
    { 
      // flip from markov to normal
      WHATAREWEDOING = 0;
      int pick = int(random(0, 27));
      loadthepage(pick);
      theframe = 0;
    }
  }
}

void keyReleased()
{
 

  // pick random pages:
  int pick = int(random(0, 27));
  loadthepage(pick);
}

void loadthepage(int page)
{
  thefilename = page+".txt"; // figure out the filename

  lines = loadStrings(thefilename); // load up the stuff

  textSize(12);
  fill(#BFBFBF);
}

