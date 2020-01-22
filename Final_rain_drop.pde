// 20171218
// kujirada renya

// HW11 : The raindrop catching game

Catcher catcher;    // One catcher object
Timer timer;        // One timer object
Drop[] drops;       // An array of drop objects
Life[] life = new Life[25];  // An array of life objects

int N = 400;         // Display size
int total_Drops = 0; // total_Drops
int Drop_Num = 1000;
int Drop_Pase = 200;
int total_Life = 25;
int Stage_Num = 1;
boolean GAME_CLEAR = false;

void setup() {
  size(400, 400);
  smooth();
  ellipseMode(CENTER);
  rectMode(CORNER);

  catcher = new Catcher(32);      // Create the catcher with a radius of 32
  drops = new Drop[Drop_Num];     // Create 1000 spots in the array

  // Display the Life Gauge
  for (int i = 0; i < total_Life; i++) {  // first life is 10
    life[i] = new Life( (i+1)*15, 20, 15, 20 );
    life[i].display();
  }

  timer = new Timer(Drop_Pase);   // Create a timer that goes off every 2 seconds
  timer.start();                  // Starting the timer
}

void draw() {
  background(255);
  
  // display the Life point
  Life_Number();
  
  // display the number of Rain
  Rain_Drop_Number();
  
  // display the Stage
  Stage_Number();

  // Set catcher location
  catcher.setLocation(mouseX, mouseY);

  // Display the catcher
  catcher.display(); 

  // Check the timer
  if (timer.isFinished()) {  // if Drop_Pase (ms) has passed, drop object is maked.
    // Deal with raindrops
    drops[total_Drops] = new Drop();  // Initialize one drop
    total_Drops ++ ;                  // Increment total_Drops      

    // If we hit the end of the array (hit the 1000 drop)
    if (total_Drops >= drops.length) {
      if(Stage_Num == 2) {
        GAME_CLEAR = true;
      }  
      total_Drops = 0;               // Start over
      Drop_Pase = Drop_Pase/10;      // *****Speed up the interval of rain drop***** //
      Stage_Num++;
    }
    timer.start();      // restart the timer
  }
  
  /****** Rain Movement *****/
  // Move and display all drops
  for (int i = 0; i < total_Drops; i++ ) {
    drops[i].move();
    drops[i].display();

    if (catcher.intersect(drops[i])) {  // if user catch the drops.
      drops[i].caught();
      total_Life++;
      total_Life = constrain(total_Life, 0, 25);
    }

    // life down
    if (drops[i].reachedBottom()) {     // if user cannoot catch the drops.
      total_Life--;
      total_Life = constrain(total_Life, 0, 25);
    }
  }

  /***** Life Gauge Movement *****/
  // Recreate and Display the Life Gauge
  stroke(0);
  fill(255);
  rect(15, 19, 376, 21);
      
  for (int l = 0; l < total_Life; l++) {
    life[l] = new Life( (l+1)*15, 20, 15, 20 );
    life[l].display();
  }
  
  /***** check the game end *****/
  End_Check();
  
}