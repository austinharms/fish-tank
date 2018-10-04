//number of fish in the tank
int fishnum = 20;
//store the images for the diffrent fish
PImage fish1;
PImage fish2;
PImage fish3;
PImage fish4;
PImage fish5;
PImage fish6;
PImage fish1I;
PImage fish2I;
PImage fish3I;
PImage fish4I;
PImage fish5I;
PImage fish6I;
//store the image for the background
PImage background;
//store bubble image
PImage bubble;
//store location of all of the fish 
PVector[] fishL = new PVector[fishnum];
//store location of all of the bubbles
PVector[] bubbleL = new PVector[25];
//stroe the speed of all of the fish
PVector[] fishV = new PVector[fishnum];
//store what image is used for the fish
int[] fishpic = new int[fishnum];
//store what fish you are working on
int fishcount = 0;
//set the size of the fish
int fishsize = 75;
//store wether the tank lights are on
boolean lights = true;
//if the code just started
boolean start = true;
//store what bubble is being worked on
int bubblecount = 0;
//start of code
void setup()
{

  //set the size of the window
  size(800, 600);

  //loop as long as bubble count dose not equal ten
  while (bubblecount != 25)
  {
    //set trandom to a random number add 25
    int trandom = int(random(400)) + 25;     
    //set the location of the bubble to the width of the screen subtract trandom and to the height of the screen subtract trandom
    bubbleL[bubblecount] = new PVector(width - trandom, 1);
    //add one to bubble count
    bubblecount++;
  }
  //set bubble count to zero
  bubblecount = 0;
  //load images of the fish
  fish1 = loadImage("fish1.png");
  fish2 = loadImage("fish2.png");
  fish3 = loadImage("fish3.png");
  fish4 = loadImage("fish4.png");
  fish5 = loadImage("fish5.png");
  fish6 = loadImage("fish6.png");
  fish1I = loadImage("fish1I.png");
  fish2I = loadImage("fish2I.png");
  fish3I = loadImage("fish3I.png");
  fish4I = loadImage("fish4I.png");
  fish5I = loadImage("fish5I.png");
  fish6I = loadImage("fish6I.png");
  //load the image for the background
  background = loadImage("background.png");
  //load the image for a bubble
  bubble = loadImage("bubble.png");
  //change whare the images are positioned from
  imageMode(CENTER);
  //display the background so it fills the screen
  image(background, width/2, height/2, width, height);
  //change the speed the program loops
  frameRate(200);
}
//main looping code
void draw()
{
  //if the boolean start is equal to true
  if (start == true)
  {
    //loop as long as fishcount is not equal to fishnum 
    while (fishcount != fishnum)
    {
      //set the photo to use for the fish
      fishpic[fishcount] = int(random(5));
      //set fishL (location) to a new pvector of 300 by 100
      fishL[fishcount] = new PVector(300, 100);
      //set fishV (speed) to a new pvector of 0.5 by 0.5
      fishV[fishcount] = new PVector(0.5, 0.5);
      //set temprandomx to a randome number between 100 to 500
      float temprandomx = random(100 - 500);
      //set temprandomx to a randome number between 100 to 500
      float temprandomy = random(100 - 500);
      // Add velocity of the fish to the location of the fish.
      fishL[fishcount].add(fishV[fishcount]);
      //set the starting location and speed of the fish temprandomx and temprandomy
      fishL[fishcount] = new PVector(temprandomx, temprandomy);
      //set temprandomx to a randome number between -1 to 1
      temprandomx = random(-1 - 1);
      //set temprandomy to a randome number between -1 to 1
      temprandomy = random(-1 - 1);
      //set the speed of the fish to temprandomx and temprandomy
      fishV[fishcount] = new PVector(temprandomx, temprandomy);
      //if the speed of the fish int the x axis is equal to zero
      if (fishV[fishcount].x == 0)
      {
        //set the speed of the fish to 0.5
        fishV[fishcount].x = 0.5;
      }
      //if the speed of the fish int the y axis is equal to zero
      if (fishV[fishcount].y == 0)
      {
        //set the speed of the fish to 0.5
        fishV[fishcount].y = 0.5;
      }
      //add one to fishcount
      fishcount++;
    }
  }

  //set start to false
  start = false;
  //remove all tint from image
  noTint();
  //display the background
  image(background, width/2, height/2, width, height);
  //if the mouse is over the light switch
  if (mousePressed && mouseX < 50 && mouseY < 75)
  {
    //if lights is equal to true
    if (lights == true)
    {
      //set lights to false
      lights = false;
      //remove all tint from image
      noTint();
      //tint colour black
      tint(0, 0, 0, 10);
      //display the background
      image(background, width/2, height/2, width, height);
      //otherwise
    } else
    {
      //set lights to true
      lights = true;
    }
    //delay the code 50 milliseconds
    delay(50);
  }


  //set colour to gray
  fill(155);
  //make light switch square in top corner
  rect(0, 0, 50, 75);
  //set colour to black
  fill(0);
  //set text size to 16
  textSize(16);
  //display text light switch
  text(" light\nswitch", 0, 20);
  //loop untill fishcount is equal to 4
  while (fishcount != fishnum)
  {
    // Add velocity of the fish to the location of the fish.
    fishL[fishcount].add(fishV[fishcount]);
    //if the fish is off the screen to the right
    if (fishL[fishcount].x > width - fishsize/2)
    {
      //set the speed of the fish in the other direction pluse a random number
      fishV[fishcount].x = fishV[fishcount].x + random(0 - 1) + 0.3 * -1;
      //if the fishs speed is grater than 3
      if (fishV[fishcount].x > 3)
      {
        //set the fish speed to 0.5
        fishV[fishcount].x = 0.5;
      }
      //move the fish to the left 5
      fishL[fishcount].x = fishL[fishcount].x - 5;
    }

    //if the fish is off the screen right to left
    if (fishL[fishcount].x < fishsize/2) 
    {
      //set the speed of the fish in the other direction pluse a random number
      fishV[fishcount].x = fishV[fishcount].x * -1 + random(0 - 1) + 0.3;
      //if the fishs speed is grater than 3
      if (fishV[fishcount].x > 3)
      {
        //set the fish speed to 0.5
        fishV[fishcount].x = 0.5;
      }
      //move the fish to the right 5
      fishL[fishcount].x = fishL[fishcount].x + 5;
    }

    //if the fish is off the screen top
    if (fishL[fishcount].y < fishsize/2)
    {
      //set the speed of the fish in the other direction pluse a random number
      fishV[fishcount].y = fishV[fishcount].y * -1 + random(0 - 1) + 0.3;
      //if the fishs speed is grater than 3
      if (fishV[fishcount].y > 3)
      {
        //set the fish speed to 0.5
        fishV[fishcount].y = 0.5;
      }
      //move the fish down 5
      fishL[fishcount].y = fishL[fishcount].y + 5;
    }

    //if the fish is off the screen bottom
    if (fishL[fishcount].y > height - fishsize/2)
    {
      //set the speed of the fish in the other direction pluse a random number and 0.2
      fishV[fishcount].y = fishV[fishcount].y + random(0 - 1) + 0.3 * -1;
      //if the fishs speed is grater than 3
      if (fishV[fishcount].y > 3)
      {
        //set the fish speed to 0.5
        fishV[fishcount].x = 0.5;
      }
    }


    //if you click the mouse and your mouse is on the fish
    if (mousePressed && mouseX > fishL[fishcount].x - fishsize/2 && mouseX < fishL[fishcount].x + fishsize/2 && mouseY > fishL[fishcount].y - fishsize/2 && mouseY < fishL[fishcount].y + fishsize/2)
    {
      //add one to fishpic
      fishpic[fishcount]++;
      //if fishpic is over 5
      if (fishpic[fishcount] > 5)
      {
        //set fishpic to zero
        fishpic[fishcount] = 0;
      }
      //delay the code 50 millisecond
      delay(60);
    }


    //add one to fishcount
    fishcount++;
  }
  //set fishcount to zero
  fishcount = 0;


  //loop untill fishcount is equal to 4
  while (fishcount != fishnum)
  {
    if (fishV[fishcount].x < 0.0)
    {
      //based on what fishpic equals
      switch(fishpic[fishcount])
      {
        //run the case if the value in the switch is equal to the value in the case
      case 0:
        //display the first fish picture
        image(fish1, fishL[fishcount].x, fishL[fishcount].y, fishsize, fishsize);
        //end the case

        break;
        //run the case if the value in the switch is equal to the value in the case
      case 1:
        //display the second fish picture
        image(fish2, fishL[fishcount].x, fishL[fishcount].y, fishsize * -1, fishsize);
        //end the case

        break;
        //run the case if the value in the switch is equal to the value in the case
      case 2:
        //display the third fish picture
        image(fish3, fishL[fishcount].x, fishL[fishcount].y, fishsize, fishsize);
        //end the case

        break;
        //run the case if the value in the switch is equal to the value in the case
      case 3:
        //display the forth fish picture
        image(fish4, fishL[fishcount].x, fishL[fishcount].y, fishsize, fishsize);
        //end the case

        break;
        //run the case if the value in the switch is equal to the value in the case
      case 4:
        //display the fith fish picture
        image(fish5, fishL[fishcount].x, fishL[fishcount].y, fishsize, fishsize);
        //end the case

        break;
        //run the case if the value in the switch is equal to the value in the case
      case 5:
        //display the sixth fish picture
        image(fish6, fishL[fishcount].x, fishL[fishcount].y, fishsize/3 * 4, fishsize);
        //end the case

        break;
      }
      //otherwise
    } else
    {
      //based on what fishpic equals
      switch(fishpic[fishcount])
      {
        //run the case if the value in the switch is equal to the value in the case
      case 0:
        //display the inverted first fish picture
        image(fish1I, fishL[fishcount].x, fishL[fishcount].y, fishsize, fishsize);
        //end the case

        break;
        //run the case if the value in the switch is equal to the value in the case
      case 1:
        //display the inverted second fish picture
        image(fish2I, fishL[fishcount].x, fishL[fishcount].y, fishsize * -1, fishsize);
        //end the case

        break;
        //run the case if the value in the switch is equal to the value in the case
      case 2:
        //display the inverted third fish picture
        image(fish3I, fishL[fishcount].x, fishL[fishcount].y, fishsize, fishsize);
        //end the case

        break;
        //run the case if the value in the switch is equal to the value in the case
      case 3:
        //display the inverted forth fish picture
        image(fish4I, fishL[fishcount].x, fishL[fishcount].y, fishsize, fishsize);
        //end the case

        break;
        //run the case if the value in the switch is equal to the value in the case
      case 4:
        //display the inverted fith fish picture
        image(fish5I, fishL[fishcount].x, fishL[fishcount].y, fishsize, fishsize);
        //end the case

        break;
        //run the case if the value in the switch is equal to the value in the case
      case 5:
        //display the inverted sixth fish picture
        image(fish6I, fishL[fishcount].x, fishL[fishcount].y, fishsize/3 * 4, fishsize);
        //end the case 
        break;
      }
    }

    //add one to fishcount
    fishcount++;
  }

  //set fishcount to zero
  fishcount = 0;
  //loop as long as bubblecount dose not equal to 25
  while (bubblecount != 25)
  {
    //if the bubble has ghon off the screen
    if (bubbleL[bubblecount].y < -25)
    {
      //set trandom to a random number add 25
      int trandom = int(random(400)) + 25;
      //set the location of the bubble to the height of the screen subtract trandom
      bubbleL[bubblecount].y = height + trandom;
      //set trandom to a random number add 25
      trandom = int(random(100)) + 25;
      //set the location of the bubble to the width of the screen subtract trandom
      bubbleL[bubblecount].x = width - trandom;
    }
    //subtract one from the bubble y location
    bubbleL[bubblecount].y = bubbleL[bubblecount].y - 7;
    //make the image semi transparent
    tint(255, 200);
    //display bubble image
    image(bubble, bubbleL[bubblecount].x, bubbleL[bubblecount].y, 50, 50);

    //add one to bubblecount
    bubblecount++;
  }
  //set bubble count to zero
  bubblecount = 0;
  //if lights is equal to false
  if (lights == false)
  {
    //set the colour to black with 150 transparency
    fill(0, 0, 0, 200);
    //make a square that covers the screen
    rect(0, 0, width, height);
  }
}

//when a key is pressed
void keyPressed()
{
  //set fishcount to zero
  fishcount = 0;
  //depending on what key is pressed
  switch(key)
  {

        //if the 0 key is pressed
  case '0':
    //loop untill fishcount is equal to 4
    while (fishcount != fishnum)
    {
      //set the picture for the fish to the random fish
      fishpic[fishcount] = int(random(5));
      //add one to fishcount
      fishcount++;
    }
    //set fish count to zero
    fishcount = 0;

    //end the case 
    break;

    //if the 1 key is pressed
  case '1':
    //loop untill fishcount is equal to 4
    while (fishcount != fishnum)
    {
      //set the picture for the fish to the first fish
      fishpic[fishcount] = 0;
      //add one to fishcount
      fishcount++;
    }
    //set fish count to zero
    fishcount = 0;

    //end the case 
    break;

    //if the 2 key is pressed
  case '2':
    //loop untill fishcount is equal to 4
    while (fishcount != fishnum)
    {
      //set the picture for the fish to the second fish
      fishpic[fishcount] = 1;
      //add one to fishcount
      fishcount++;
    }
    //set fish count to zero
    fishcount = 0;

    //end the case 
    break;

    //if the 3 key is pressed
  case '3':
    //loop untill fishcount is equal to 4
    while (fishcount != fishnum)
    {
      //set the picture for the fish to the third fish
      fishpic[fishcount] = 2;
      //add one to fishcount
      fishcount++;
    }
    //set fish count to zero
    fishcount = 0;

    //end the case 
    break;
    //if the 4 key is pressed
  case '4':
    //loop untill fishcount is equal to 4
    while (fishcount != fishnum)
    {
      //set the picture for the fish to the fouth fish
      fishpic[fishcount] = 3;
      //add one to fishcount
      fishcount++;
    }
    //set fish count to zero
    fishcount = 0;

    //end the case 
    break;

    //if the 5 key is pressed
  case '5':
    //loop untill fishcount is equal to 4
    while (fishcount != fishnum)
    {
      //set the picture for the fish to the fith fish
      fishpic[fishcount] = 4;
      //add one to fishcount
      fishcount++;
    }
    //set fish count to zero
    fishcount = 0;

    //end the case 
    break;

    //if the 6 key is pressed
  case '6':
    //loop untill fishcount is equal to 4
    while (fishcount != fishnum)
    {
      //set the picture for the fish to the sixth fish
      fishpic[fishcount] = 5;
      //add one to fishcount
      fishcount++;
    }
    //set fish count to zero
    fishcount = 0;

    //end the case 
    break;
  }
}

/**
my shapes and images are the light switch the 12 diffrent pictures for the fish and the image for the bubble also the text for the lights switch
myself taught animation is using pvectors and velocity so the fish have speed as while as a location i adapted this exsample https://processing.org/examples/bouncingball.html
my animations that were not from the website are adding images, moving images, making a square and adding text
when you press the 1-6 keys it sets the fish all to one image if you press 0 is sets tham all random
when you click on a fish it changes what type of fish it is, if you click on the light switch is turns off or on the "lights"
*/
