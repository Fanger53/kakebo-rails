import Chart from 'chart.js/auto';

const charGenerator = () => { document.addEventListener('turbolinks:load', () => {
    var ctx = document.getElementById('home__chart').getContext('2d');
    var myChart = new Chart(ctx, {
    type: 'bar',
    options: {
      plugins: {
        title: {
          display: true,
          text: 'Custom Chart Title',
          padding: {
              top: 10,
              bottom: 30
          }
      },
      }
    },
    data: {
      labels: JSON.parse(ctx.canvas.dataset.labels),
      datasets: [{
        data: JSON.parse(ctx.canvas.dataset.data),
        label: "Transfers",
      }]
    },
    });
  })
}

export default charGenerator;