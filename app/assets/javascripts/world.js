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
    if(point.entities.length == 0) {
      this.drawRect(x, y, point.landscape, 1);
    } else {

      let entities = point.entities

      const importantEntites = point.entities.filter(e => e.type != 'grass');

      if(importantEntites.length > 0) {
        entities = importantEntites;
      }

      let fullnest = entities.length;
      entities.forEach(entity => {
        this.drawRect(x, y, entity.type, 1.0 / fullnest);
      })

    }
  }

  drawRect(x, y, colour, globalAlpha) {
    let color = this.COLOURS[colour];
    let context = this.canvas.getContext('2d');
    context.beginPath();
    context.strokeStyle = color;
    context.fillStyle = color;
    context.globalAlpha = globalAlpha;
    context.rect(x * this.pointWidth, y * this.pointHeight, this.pointWidth, this.pointHeight);
    context.fill();
  }
}

App.cable.subscriptions.create("WorldUpdaterChannel", {
  received: function(data) {
    const worldData = JSON.parse(data['world']);
    if(worldUuid && data['world_id'] == worldUuid) {
      const drawer = new WorldDrawer(worldData['ground']);
      drawer.draw();
    }
  }
});
