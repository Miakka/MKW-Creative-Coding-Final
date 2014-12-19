
void drawstraight()
{
  background(250);
  fill(235);

  textFont(thefont);
  textSize(textsize); 
  y = textsize*2;
  for (int i = 2; i<lines.length; i++) // this goes through the lines in the text
  {
    String words[] = lines[i].split(" "); // this splits up the current line into words
    x = 20; // this is your left margin
    for (int j = 0; j<words.length; j++) // this goes through the words in the current line
    {
      // doing some color checking based on the current word:
      if (words[j].equals("I")) {
        fill(255, 0, 255);
      } else if (words[j].equals("love")) {
        fill(#F51616);
        }else if (words[j].equals("hate")) {
        fill(#1C1919);
        }else if (words[j].equals("fuck")) {
        fill(#2027A5);
        }else if (words[j].equals("drunk")) {
        fill(#7F7F89);
      } else 
      {
        fill(235); // default color is based on the file
      }
      // --- end color checking ---


      // if this word is gonna hit the right edge of the screen, do a "carriage return":      
      if (x+textWidth(words[j])>width) {
        x = 20;
        y = y +textsize;
      }
      // draw the word
      text(words[j], x, y);
      // move our x position
      x = x + int(textWidth(words[j]+ ' '));
    }
    // at the end of every line, also do a carriage return
    y = y + textsize;
  }
}


void drawmarkov()
{


  textFont(themarkovfont);
  textSize(36);

  fill(#62E0ED);
  mc.tick();
  println(mc.current);
  float tw = textWidth(mc.current+" ");
  if (x+tw>width)
  {
    x = 20;
    y+=36;
  }
  text(mc.current, x, y);
  x+=tw;
  if (y>height)
  {
    x = 20;
    y = 30;
    background(250);
  }
}

