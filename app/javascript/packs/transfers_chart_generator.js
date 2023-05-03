import Chart from 'chart.js/auto';

const transfersChartGenerator = () => { document.addEventListener('turbolinks:load', () => {
    var ctx = document.getElementById('transfers_home__chart').getContext('2d');
    var myChart = new Chart(ctx, {
    type: 'bar',
    options: {
      plugins: {
        title: {
          display: true,
          text: 'Total Transfers',
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
        backgroundColor: ["#cb1d1dc6"],
      }]
    },
    });
  })
}

export default transfersChartGenerator;