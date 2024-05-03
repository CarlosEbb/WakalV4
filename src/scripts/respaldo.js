export async function preparechart(cliente_id, id_chart, type_chart, color_1, color_2, title, customFunction, old_chart = null){
    let chart;  
    let renderizo;  
    if (document.querySelector(`.${id_chart}`) && typeof ApexCharts !== 'undefined') {
        //renderizar todo vacio por primera vez
  
        let chartElement = document.querySelector(`.${id_chart}`);
        var clase_chart_1 = `${id_chart}_${cliente_id}`;//chart_1
        var storageName_chart_1 = `total_${clase_chart_1}`;
        var storageName_category_chart_1 = `category_${clase_chart_1}`;
        const cache_total_chart_1 = localStorage.getItem(storageName_chart_1);
        const cache_category_chart_1 = localStorage.getItem(storageName_category_chart_1);
    
  
        if (chartElement && chartElement.hasChildNodes()) {
          chart = old_chart;
          
          if (cache_total_chart_1 && cache_category_chart_1) {
            chart.updateOptions(optionConfig(JSON.parse(cache_total_chart_1), JSON.parse(cache_category_chart_1), color_1, color_2, title, type_chart));
          }else{
            localStorage.setItem(storageName_chart_1, JSON.stringify([0, 0, 0, 0, 0]));
            localStorage.setItem(storageName_category_chart_1, JSON.stringify(['~', '~', '~', '~', '~']));
            chart.updateOptions(optionConfig([0, 0, 0, 0, 0], ['~', '~', '~', '~', '~'], color_1, color_2, title, type_chart));
          }
        } else {
          if (cache_total_chart_1 && cache_category_chart_1) {
            renderizo = optionConfig(JSON.parse(cache_total_chart_1), JSON.parse(cache_category_chart_1), color_1, color_2, title, type_chart);
          }else{
            localStorage.setItem(storageName_chart_1, JSON.stringify([0, 0, 0, 0, 0]));
            localStorage.setItem(storageName_category_chart_1, JSON.stringify(['~', '~', '~', '~', '~']));
            renderizo = optionConfig([0, 0, 0, 0, 0], ['~', '~', '~', '~', '~'], color_1, color_2, title, type_chart);
          }
          chart = new ApexCharts(chartElement, renderizo);
          chart.render();
        }
  
        
    
        const responseData = await customFunction(); // Ejecuta la función personalizada
        localStorage.setItem(storageName_chart_1, JSON.stringify(Object.values(responseData)));
        localStorage.setItem(storageName_category_chart_1, JSON.stringify(Object.keys(responseData)));
        chart.updateOptions(optionConfig(Object.values(responseData),Object.keys(responseData), color_1, color_2, title, type_chart));
      }
      return chart;
  }