class Life {
  int x_pos, y_pos;  // Rectangle's x_position, y_posiion
  int wid, hei;      // Rectangle's width, height
  color c;
  
  Life(int x, int y, int w, int h) {
   x_pos = x;
   y_pos = y;
   wid = w;
   hei = h;
   
   if(total_Life < 5) {
      c = #ff0000;
   } else if (total_Life < 14) {
      c = #ffff00;
   } else {
      c = #90ee90;
   }
   
   //c = color(0, 255, 0);
  }
  
  void display() {
    fill(c);
    noStroke();
    rect(x_pos + 1, y_pos, wid, hei);
    
    fill(255);
    rect(x_pos + wid, y_pos, 1, y_pos);
    
    //rect(150 - (number) * 10, 370, 159 - (number) * 10, 390);
  }
  
}  