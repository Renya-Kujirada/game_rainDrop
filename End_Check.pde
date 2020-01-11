void End_Check() {
  
  // GameOver
  if(total_Life == 0) {
    background(0);
    fill(255, 0, 0);
    textSize(60);
    text("GAMEOVER", N / 8, N / 5 * 2.5);
    noLoop();
  }
  
  // GameClear
  if(GAME_CLEAR) {
    background(255);
    fill(0, 0, 255);
    textSize(60);
    text("GAMECLEAR!", N / 18, N / 5 * 2.5);
    noLoop();
  }  
}  