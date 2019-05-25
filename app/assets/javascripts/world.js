class WorldDrawer {
  constructor(data) {
    this.data = data;

    this.pointHeight = 10;
    this.pointWidth = 10;

    this.canvas = document.getElementById('world');

  }

  draw() {
    this.data.forEach((line, x) => {
      line.forEach((point,  y) => {
        this.drawPoint(x, y, point);
      });
    });
  }

  drawPoint(x, y, color) {
    let context = this.canvas.getContext('2d');
    context.beginPath();
    context.strokeStyle = color;
    context.fillStyle = color;
    context.rect(x * this.pointWidth, y * this.pointHeight, this.pointWidth, this.pointHeight);
    context.fill();
  }
}


document.addEventListener("DOMContentLoaded", function() {
  const drawer = new WorldDrawer(worldData);
  drawer.draw();
});
