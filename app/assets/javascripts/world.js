class WorldDrawer {
  constructor(data) {
    this.data = data;

    this.pointHeight = 10;
    this.pointWidth = 10;

    let canvas = document.getElementById('world');
    this.context = canvas.getContext('2d');
  }

  draw() {
    this.data.forEach((line, x) => {
      line.forEach((point,  y) => {
        this.drawPoint(x, y, point);
      });
    });
  }

  drawPoint(x, y, color) {
    this.context.strokeStyle = color;
    this.context.fillStyle = color;
    this.context.rect(x * this.pointWidth, y * this.pointHeight, this.pointWidth, this.pointHeight);
    this.context.fill();
  }
}


document.addEventListener("DOMContentLoaded", function() {
  const data = [
    [
      '#777',
      '#777',
    ],
    [
      '#777',
      '#777',
    ],
  ];

  const drawer = new WorldDrawer(data);
  drawer.draw();
});
