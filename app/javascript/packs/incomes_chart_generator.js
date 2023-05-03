import Chart from 'chart.js/auto';

const incomesChartGenerator = () => { document.addEventListener('turbolinks:load', () => {
    var ctx = document.getElementById('incomes_home__chart').getContext('2d');
    var myChart = new Chart(ctx, {
    type: 'bar',
    options: {
      plugins: {
        title: {
          display: true,
          text: 'Total Incomes',
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
        label: "Incomes",
      }]
    },
    });
  })
}

export default incomesChartGenerator;