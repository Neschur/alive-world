class WorldDrawer {
  COLOURS = {
    land: '#c17e00',
    stone: '#4e4431',
    grass: '#00ac17',
    grazer: '#275fe2',
    predator: '#9014c1',
  }

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

  drawPoint(x, y, point) {
    let color = this.COLOURS[point];
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
