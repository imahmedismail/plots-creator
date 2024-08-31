import Plotly from 'plotly.js-dist';

const PlotlyHook = {
  mounted() {
    this.renderHistogram();
  },
  updated() {
    this.renderHistogram();
  },
  renderHistogram() {
    const el = this.el;
    let dataset = this.el.getAttribute("phx-dataset");
    dataset = JSON.parse(dataset);

    let x = dataset.map(d => d.x); 
    let y = dataset.map(d => d.y); 

    const trace = {
      x: x,
      type: 'histogram',
      name: 'Histogram'
    };

    const data = [trace];
    const layout = {
      title: 'Histogram of Values',
      xaxis: { title: y },
      yaxis: { title: 'Count of Records' }
    };

    Plotly.newPlot(el, data, layout).catch(console.error);
  }
};

export default PlotlyHook;
