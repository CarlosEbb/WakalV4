import ApexCharts from "apexcharts";
import { apiController } from './request.js';
import {obtenerNombreDelMes, formatearNumero} from "./utils.js";

export  function optionConfig(totales, category, color_1 = ["#e2cf41"], color_2 = ["#d56c5f"], title = "Gráfica", type_chart = "bar"){
    let values_series;
    let values_height;
    if(type_chart == "radialBar"){
      values_height = 390;
      values_series = calculatePercentages(totales);
    }else{
      values_height = 300;
      values_series = [
          {
              name: "Controles Emitidos",
              data: totales,
          },
      ];
    }
    return  {
      series: values_series,
      labels: category,
      legend: {
        show: false,
        //floating: true,
        position: 'right',
        //offsetX: 280,
        //offsetY: 200,
        formatter: function(val, opts) {
          console.log(opts);
          return val + " - " + totales[opts.seriesIndex]
        }
      },
      chart: {
          width: '100%',
          height: values_height,
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
              gradientToColors: color_2,
              shadeIntensity: 1,
              type: "horizontal",
              opacityFrom: 0.9,
              opacityTo: 0.9,
          },
      },
      plotOptions: {
        radialBar: {
          offsetY: 0,
          startAngle: -180,
          endAngle: 180,
          hollow: {
            margin: 5,
            size: "10%",
            background: "transparent",
            image: undefined,
          },
          track: {
            show: false,
          },
          dataLabels: {
            name: {
              show: true,
            },
            value: {
              show: true,
            },
          },
        },
      },
      colors: color_1,
      yaxis: {
          labels: {
          formatter: function(value) {
            return value;
          }
        }
      },
  };
}

export async function preparechart(cliente_id, id_chart, type_chart, color_1, color_2, title, customFunction, old_chart = null){
  let chart;  
  let renderizo;  
  if (document.querySelector(`.${id_chart}`) && typeof ApexCharts !== 'undefined') {
      let chartElement = document.querySelector(`.${id_chart}`);
      var clase_chart_1 = `${id_chart}_${cliente_id}`;//chart_1
      var storageName_chart_1 = `total_${clase_chart_1}`;
      var storageName_category_chart_1 = `category_${clase_chart_1}`;

      const updateChart = (total, category) => {
        chart.updateOptions(optionConfig(total, category, color_1, color_2, title, type_chart));
      }

      const renderChart = (total, category) => {
        renderizo = optionConfig(total, category, color_1, color_2, title, type_chart);
        chart = new ApexCharts(chartElement, renderizo);
        chart.render();
      }

      const cache_total_chart_1 = localStorage.getItem(storageName_chart_1);
      const cache_category_chart_1 = localStorage.getItem(storageName_category_chart_1);

      if (chartElement && chartElement.hasChildNodes()) {
        chart = old_chart;
        if (cache_total_chart_1 && cache_category_chart_1) {
          updateChart(JSON.parse(cache_total_chart_1), JSON.parse(cache_category_chart_1));
        } else {
          localStorage.setItem(storageName_chart_1, JSON.stringify([0, 0, 0, 0, 0]));
          localStorage.setItem(storageName_category_chart_1, JSON.stringify(['~', '~', '~', '~', '~']));
          updateChart([0, 0, 0, 0, 0], ['~', '~', '~', '~', '~']);
        }
      } else {
        if (cache_total_chart_1 && cache_category_chart_1) {
          renderChart(JSON.parse(cache_total_chart_1), JSON.parse(cache_category_chart_1));
        } else {
          localStorage.setItem(storageName_chart_1, JSON.stringify([0, 0, 0, 0, 0]));
          localStorage.setItem(storageName_category_chart_1, JSON.stringify(['~', '~', '~', '~', '~']));
          renderChart([0, 0, 0, 0, 0], ['~', '~', '~', '~', '~']);
        }
      }

      const responseData = await customFunction(); // Ejecuta la función personalizada
      if(responseData != null){
        localStorage.setItem(storageName_chart_1, JSON.stringify(Object.values(responseData)));
        localStorage.setItem(storageName_category_chart_1, JSON.stringify(Object.keys(responseData)));
        updateChart(Object.values(responseData),Object.keys(responseData));
      }
    }
    return chart;
}

export async function customFunctionApi_chart_1(token, url){
    const responseData = await apiController(import.meta.env.PUBLIC_BASE_URL,url,'GET',null,token);
    return responseData.data;
}


export function calculatePercentages(totales) {
  let max = Math.max(...totales);
  let percentages = totales.map(number => Math.round((number / max) * 100));
  return percentages;
}

export   function agregarDivsDesdeJsonLeyenda(clase,datos) {
  // Obtén el div contenedor
  var contenedor = document.querySelector(clase);
  if (contenedor !== null) {
    contenedor.innerHTML = '';
    // Agrega la clase 'grid'
    contenedor.classList.add('grid');
  
    // Agrega la clase 'grid-cols-[n]'
    var agregarNro = datos.length > 5 ? "5" : datos.length;
    contenedor.classList.add('grid-cols-2');
    contenedor.classList.add(`md:grid-cols-5`);
    
  
    // Recorre los datos
    for (var i = 0; i < datos.length; i++) {
      // Crea un nuevo div
      var nuevoDiv = document.createElement('div');
      nuevoDiv.className = "flex flex-col justify-center items-center text-center mt-3";
  
      // Crea el div del círculo
      var divCirculo = document.createElement('div');
      divCirculo.className = "h-2.5 w-2.5 rounded-full " + datos[i].color_circulo;
      divCirculo.style.backgroundColor = datos[i].color_circulo;
      divCirculo.setAttribute('data-tippy-content', datos[i].anio);
  
  
      // Crea los spans
      var spanPorcentaje = document.createElement('span');
      spanPorcentaje.textContent = datos[i].porcentaje;
      var spanValor = document.createElement('span');
      spanValor.textContent = datos[i].valor;
      var spanAnio = document.createElement('span');
      spanAnio.textContent = datos[i].anio;
  
      // Añade los elementos al nuevo div
      nuevoDiv.appendChild(divCirculo);
      nuevoDiv.appendChild(spanPorcentaje);
      nuevoDiv.appendChild(spanValor);
      nuevoDiv.appendChild(spanAnio);
  
      // Añade el nuevo div al contenedor
  
      contenedor.appendChild(nuevoDiv);
    }
  }
}

export function proyectarVentas(meses, ventas) {
  // Calcula la suma de las ventas y la suma de los meses (considerando Enero como 1, Febrero como 2, etc.)
  var sumVentas = 0, sumMeses = 0;
  for (var i = 0; i < ventas.length; i++) {
      sumVentas += ventas[i];
      sumMeses += i + 1;
  }

  // Calcula los promedios
  var promVentas = sumVentas / ventas.length;
  var promMeses = sumMeses / meses.length;

  // Calcula la pendiente (b1) y la intersección con el eje y (b0) para la línea de regresión
  var b1 = 0, b0 = 0, sumNumerador = 0, sumDenominador = 0;
  for (var i = 0; i < ventas.length; i++) {
      sumNumerador += (i + 1 - promMeses) * (ventas[i] - promVentas);
      sumDenominador += Math.pow(i + 1 - promMeses, 2);
  }
  b1 = sumNumerador / sumDenominador;
  b0 = promVentas - b1 * promMeses;

  // Usa la línea de regresión para proyectar las ventas del próximo mes (el mes después del último mes en el array de meses)
  var proyeccionProximoMes = b0 + b1 * (meses.length + 1);

  return Math.round(proyeccionProximoMes);
}

export function crearContenidoProyeccion(mes, valor) {
  let elemento = document.querySelector('.proyeccion_chart_3');
  if (elemento) {
    // Crea el texto de la proyección
    var textoProyeccion = document.createTextNode("Proyección de ");

    // Crea el span del mes
    var spanMes = document.createElement('span');
    spanMes.className = "proyeccion_mes";
    spanMes.textContent = mes;

    // Crea el texto "Estimada:"
    var textoEstimada = document.createTextNode(" Estimada:");

    // Crea el div del valor
    var divValor = document.createElement('div');
    divValor.className = "proyeccion_valor text-4xl";
    divValor.textContent = valor;

    // Crea un fragmento de documento para contener los elementos
    var fragmento = document.createDocumentFragment();
    fragmento.appendChild(textoProyeccion);
    fragmento.appendChild(spanMes);
    fragmento.appendChild(textoEstimada);
    fragmento.appendChild(divValor);

    // Retorna el fragmento de documento
    elemento.innerHTML = '';
    elemento.appendChild(fragmento);
  }
}

export function procesarDatosLeyenda(totales, meses) {
  let porcentajes;
  let colors;
  let datos = [];
  if (Array.isArray(totales)){
    porcentajes = calculatePercentages(totales); // Asegúrate de que esta función devuelve un array del mismo tamaño que 'totales'
    colors = ["#1e1e40", "#6258a1", "#4f61ab", "#3494c6","#ea5f5a", "#e77a82", "#f29140"];
  
    for (let i = 0; i < totales.length; i++) {
        datos.push({
            "color_circulo": colors[i],
            "porcentaje": isNaN(porcentajes[i]) ? '0%' : porcentajes[i] + "%",
            "valor": isNaN(totales[i]) ? '0' : formatearNumero(totales[i].toString()),
            "anio": meses[i]
        });
    }
    
    agregarDivsDesdeJsonLeyenda('.leyenda_chart_3', datos);
    let proximoMes = new Date().getMonth() + 2; // obtiene el próximo mes (1-12)
    crearContenidoProyeccion(obtenerNombreDelMes(proximoMes), formatearNumero(proyectarVentas(meses, totales)));
  }
}