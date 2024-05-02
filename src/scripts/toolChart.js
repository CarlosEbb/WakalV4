import ApexCharts from "apexcharts";
import { apiController } from './request.js';

export  function optionConfig(totales, category, color_1 = "#e2cf41", color_2 = "#d56c5f", title = "Gráfica", type_chart = "bar"){
    return  {
          series: [
              {
                  name: "Controles Emitidos",
                  data: totales,
              },
          ],
          
          chart: {
              height: 300,
              type: type_chart,
          },
          //forecastDataPoints: {
          //    count: 20,
          //},
          stroke: {
              width: 0,
              curve: "smooth",
              //dashArray: [0],
          },
          xaxis: {
              type: "category",
              categories: category,
              labels: {
                  //formatter: function (value, timestamp, opts) {
                    //return convertirMesInglesAEspanol(moment(new Date(timestamp)).locale('es').format('DD MMM'));
                  //},
              },
          },
          title: {
              text: title,
              align: "left",
              style: {
                  fontSize: "16px",
                  color: "#666",
              },
          },
          fill: {
              type: "gradient",
              gradient: {
                  shade: "dark",
                  gradientToColors: [color_2],
                  shadeIntensity: 1,
                  type: "horizontal",
                  opacityFrom: 0.9,
                  opacityTo: 0.9,
              },
          },
          colors: [color_1],
          yaxis: {},
      };
}

export async function preparechart(cliente_id, id_chart, type_chart, color_1, color_2, title, customFunction, old_chart = null){
  let chart;  
  if (document.querySelector(`.${id_chart}`) && typeof ApexCharts !== 'undefined') {
      //renderizar todo vacio por primera vez

      let chartElement = document.querySelector(`.${id_chart}`);
      if (chartElement && chartElement.hasChildNodes()) {
        chart = old_chart;
      } else {
        chart = new ApexCharts(chartElement, optionConfig([0, 0, 0, 0, 0], ['~', '~', '~', '~', '~'], color_1, color_2, title, type_chart));
        chart.render();
      }


    
      var clase_chart_1 = `${id_chart}_${cliente_id}`;//chart_1
      var storageName_chart_1 = `total_${clase_chart_1}`;
      var storageName_category_chart_1 = `category_${clase_chart_1}`;
      const cache_total_chart_1 = localStorage.getItem(storageName_chart_1);
      const cache_category_chart_1 = localStorage.getItem(storageName_category_chart_1);
  
      if (cache_total_chart_1 && cache_category_chart_1) {
        chart.updateOptions(optionConfig(JSON.parse(cache_total_chart_1), JSON.parse(cache_category_chart_1), color_1, color_2, title, type_chart));
      }else{
        localStorage.setItem(storageName_chart_1, JSON.stringify([0, 0, 0, 0, 0]));
        localStorage.setItem(storageName_category_chart_1, JSON.stringify(['~', '~', '~', '~', '~']));
        chart.updateOptions(optionConfig([0, 0, 0, 0, 0], ['~', '~', '~', '~', '~'], color_1, color_2, title, type_chart));
      }
  
      const responseData = await customFunction(); // Ejecuta la función personalizada
      localStorage.setItem(storageName_chart_1, JSON.stringify(Object.values(responseData)));
      localStorage.setItem(storageName_category_chart_1, JSON.stringify(Object.keys(responseData)));
      chart.updateOptions(optionConfig(Object.values(responseData),Object.keys(responseData), color_1, color_2, title, type_chart));
    }
    return chart;
}

export async function customFunctionApi_chart_1(token, url){
    const responseData = await apiController(import.meta.env.PUBLIC_BASE_URL,url,'GET',null,token);
    return responseData.data;
}