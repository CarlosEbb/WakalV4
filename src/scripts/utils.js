import moment from 'moment';
import 'moment/locale/es';  // Importa el locale español
import { apiController } from '../scripts/request.js';

export function convertDateTime(dateTime,format) {
    // Establece el locale a español
    moment.locale('es');

    // Convertir la fecha y hora al formato deseado
    let convertedDateTime = moment(dateTime, 'YYYY-MM-DD HH:mm:ss.SSSS').format(format);

    return convertedDateTime;
}

export function incrementoNumerico(vinicial, vFinal, clase) {
    var valorInicial = parseInt(vinicial);
    var valorFinal = parseInt(vFinal);
    var duracion = 2000; // Duración total en milisegundos
    var incremento = (valorFinal - valorInicial) / (duracion / 10); // Calculamos el incremento para cada intervalo de 10ms
    var elemento = document.querySelector("."+clase);
    if(elemento){
      if (valorInicial == valorFinal) {
        elemento.textContent = valorFinal.toLocaleString('de-DE');
      } else {
        var intervalo = setInterval(function() {
          valorInicial += incremento;
          if (valorInicial > valorFinal) {
            valorInicial = valorFinal;
          }
          elemento.textContent = Math.floor(valorInicial).toLocaleString('de-DE');
      
          if (valorInicial >= valorFinal) {
            clearInterval(intervalo);
            elemento.textContent = valorFinal.toLocaleString('de-DE');
          }
        }, 10); // Actualiza cada 10 milisegundos
      }
    }
  }

export async function actualizarDatos(token, url, clase, valor = 0) {
    let totalCard1Cache = localStorage.getItem('total_'+clase);
    if(url != null){
      const responseData = await apiController(import.meta.env.PUBLIC_BASE_URL,url,'GET',null,token);
      if (responseData.data && responseData.data.total) {
        incrementoNumerico(totalCard1Cache, parseInt(responseData.data.total), clase);
        localStorage.setItem('total_'+clase, responseData.data.total);
      }
    }else{
        incrementoNumerico(totalCard1Cache, parseInt(valor), clase);
        localStorage.setItem('total_'+clase, valor);
    }
  }

export function obtenerCookie(nombre) {
    var nombreEQ = nombre + "=";
    var ca = document.cookie.split(';');
    for(var i=0;i < ca.length;i++) {
      var c = ca[i];
      while (c.charAt(0)==' ') c = c.substring(1,c.length);
      if (c.indexOf(nombreEQ) == 0) return decodeURIComponent(c.substring(nombreEQ.length,c.length));
    }
    return null;
  }

export function getQueryParam(paramName) {
    // Crea una nueva instancia de URLSearchParams
    const urlParams = new URLSearchParams(window.location.search);

    // Usa el método get para obtener el valor del parámetro
    const paramValue = urlParams.get(paramName);

    // Si el parámetro no existe, get devuelve null
    return paramValue;
}

export function getAllQueryParams() {
  // Crea una nueva instancia de URLSearchParams con los parámetros de la URL actual
  const urlParams = new URLSearchParams(window.location.search);

  // Crea un objeto para almacenar todos los parámetros
  const params = {};

  // Itera sobre cada par clave-valor en urlParams
  for (const [key, value] of urlParams.entries()) {
      params[key] = value;
  }

  // Devuelve el objeto con todos los parámetros
  return params;
}

export function getQueryString(params) {
  const queryParams = new URLSearchParams(params);
  return queryParams.toString();
}

export function convertirMesInglesAEspanol(cadena) {
  const mesesIngles = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  const mesesEspanol = ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'];

  let nuevaCadena = cadena;

  for(let i = 0; i < mesesIngles.length; i++) {
      // Crea una expresión regular para buscar el mes en inglés en la cadena
      let regex = new RegExp('\\b' + mesesIngles[i] + '\\b', 'g');
      // Reemplaza todas las ocurrencias del mes en inglés por el mes en español
      nuevaCadena = nuevaCadena.replace(regex, mesesEspanol[i]);
  }

  return nuevaCadena;
}

export function obtenerNombreDelMes(numeroDelMes) {
  const meses = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];

  // Restamos 1 al número del mes porque los arrays en JavaScript empiezan en 0
  return meses[numeroDelMes - 1];
}

export function obtenerNumeroMes(fecha) {
  // Crear un objeto Moment a partir de la fecha
  let fechaMoment = moment(fecha, 'YYYY-MM-DD');

  // Obtener el mes en formato numérico con dos dígitos (de 01 a 12)
  let mesNumerico = fechaMoment.format('MM');

  return mesNumerico;
}

export function formatearNumero(valor) {
  return Math.floor(valor).toLocaleString('de-DE')
}

export function formatearNumeroControl(num) {
  let str = num.toString().replace('-', '');;
  while (str.length < 10) {
      str = '0' + str;
  }
  return str.slice(0, 2) + '-' + str.slice(2);
}

export function setElementValueByName(name, value) {
  var inputElement = document.querySelector('input[name="' + name + '"]');
  var selectElement = document.querySelector('select[name="' + name + '"]');

  if (inputElement) {
    if (inputElement.type === 'checkbox'){
      inputElement.checked = true;
    }else{
      inputElement.value = value;
    }
  } else if (selectElement) {
      selectElement.value = value;
      // Opcionalmente, puedes disparar el evento 'change' si necesitas que otros scripts respondan al cambio de valor.
      var event = new Event('change');
      selectElement.dispatchEvent(event);
  } else {
      console.log('No se encontró ningún input o select con el nombre "' + name + '".');
  }
}

export function capitalizeFirstLetter(input) {
  // Obtener el valor actual del input
  let value = input.value;

  // Verificar si el valor no está vacío
  if (value.length > 0) {
      // Capitalizar la primera letra y combinarla con el resto del texto
      input.value = value.charAt(0).toUpperCase() + value.slice(1);
  }
}

export function formatNumber(input) {
  // Verificar si el input es null o undefined
  if (input == null) {
      return "0,00";
  }

  // Convertir el input a string (en caso de que no lo sea) y eliminar puntos, comas y ceros a la izquierda
  let cleanedNumber = String(input).replace(/[\.,]/g, ''); // Elimina puntos y comas
  cleanedNumber = cleanedNumber.replace(/^0+/, ''); // Elimina ceros a la izquierda

  // Manejar el caso donde el número es vacío después de eliminar ceros a la izquierda
  if (cleanedNumber === '') {
      cleanedNumber = '0';
  }

  // Agregar la coma para los centavos
  if (cleanedNumber.length <= 2) {
      cleanedNumber = cleanedNumber.padStart(3, '0'); // Asegurar que haya al menos 3 dígitos para la coma
  }
  let numberWithComma = cleanedNumber.slice(0, -2) + ',' + cleanedNumber.slice(-2);

  // Agregar los puntos para los miles
  let parts = numberWithComma.split(',');
  let integerPart = parts[0];
  let decimalPart = parts[1];
  let formattedIntegerPart = integerPart.replace(/\B(?=(\d{3})+(?!\d))/g, '.'); // Agrega puntos a los miles

  return formattedIntegerPart + ',' + decimalPart;
}

export function findPlaceholder(data, valueToFind) {
  if(data != null){
    const { placeholder, values } = data;
    const stringValueToFind = String(valueToFind); // Convertir el valor a buscar a cadena
  
    for (let i = 0; i < values.length; i++) {
      // Convertir cada valor en el array a cadena y verificar si coincide
      if (values[i].some(value => String(value) === stringValueToFind)) {
        return placeholder[i];
      }
    }
  }

  return '-'; // Si no se encuentra el valor
}

// Manejar el evento change del select .tipoBusqueda
export function handleSelectChange(selectedOption, data, created_at) {
  console.log(data);
  var contentHtml = document.querySelector('.contentConsultas');
  var contentInputHtml = document.querySelector('.contentConsultasInput');

  if (selectedOption === '') {
      contentHtml.classList.add('hidden');
  } else {
      contentHtml.classList.remove('hidden');
  }
  var parametros = data.find(item => item.id == selectedOption).parametros;
  var content = '';

  parametros.forEach(param => {
      if (param.tipo_input === 'text') {
          content += '<input required class="w-full px-4 py-3 mx-2 rounded-full focus:border-blue-500 border-none text-sm bg-custom-quaternary select-none" type="text" name="' + param.name + '" placeholder="' + param.placeholder + '" />';
          if(param.name == "numero_control" || param.name == "numero_documento"){
            content += `<div class="relative flex items-center hidden"><input id="${param.name}_check" checked name="especifico_check" type="checkbox" value="1" class="appearance-none w-6 h-6 rounded-full border-2 border-gray-400 checked:bg-custom-primary checked:border-transparent focus:outline-none transition-all duration-300 mr-2"/><label for="${param.name}_check" class="text-sm cursor-pointer select-none text-white">Específico</label></div>`;
          }
      } else if (param.tipo_input === 'selected') {
        var selectOptions = param.column_reference_cliente_value;
        if(selectOptions != null){
          var selectHtml = '<select required class="w-full px-4 py-3 mx-2 rounded-full focus:border-blue-500 border-none text-sm bg-custom-quaternary select-none" name="' + param.name + '"><option selected disabled value="">' + param.placeholder + '</option>';
    
          for (var i = 0; i < selectOptions.values.length; i++) {
              selectHtml += '<option value="' + selectOptions.values[i].join(";") + '">' + selectOptions.placeholder[i] + '</option>';
          }
          selectHtml += '<option value="all">Todos</option>';
          selectHtml += '</select>';

          content += selectHtml;
        }else{
          
          content += '<select required class="w-full px-4 py-3 mx-2 rounded-full focus:border-blue-500 border-none text-sm bg-custom-quaternary select-none" name="' + param.name + '"><option value="">' + param.placeholder + '</option></select>';
          
        }
      } else if (param.tipo_input === 'date') {
        if(param.name == "fecha"){

          const today = new Date();
          const year = today.getFullYear();
          const month = String(today.getMonth() + 1).padStart(2, '0'); // Los meses son base 0, por eso sumamos 1
          const day = String(today.getDate()).padStart(2, '0');
  
          const formattedDate = `${year}-${month}-${day}`;

          content += '<select required class="w-full px-4 py-3 mx-2 rounded-full focus:border-blue-500 border-none text-sm bg-custom-quaternary select-none" name="tipo_fecha"><option selected disabled value="">Tipo de Fecha</option><option value="emision">Emisión</option><option value="asignacion">Asignación</option></select>';
          content += '<input required min="'+created_at+'" max="'+formattedDate+'" class="limit_date_moth_inicio w-full px-4 py-3 mx-2 rounded-full focus:border-blue-500 border-none text-sm bg-custom-quaternary select-none" type="date" name="' + param.name + "_inicio" + '" placeholder="Fecha Inicial" />';
          content += '<input required min="'+created_at+'" max="'+formattedDate+'" class="limit_date_moth_final w-full px-4 py-3 mx-2 rounded-full focus:border-blue-500 border-none text-sm bg-custom-quaternary select-none" type="date" name="' + param.name + "_final" + '" placeholder="Fecha Final" />';
        }else{
          content += '<input required class="w-full px-4 py-3 mx-2 rounded-full focus:border-blue-500 border-none text-sm bg-custom-quaternary select-none" type="date" name="' + param.name + '" placeholder="' + param.placeholder + '" />';
        }
      }
  });

  contentInputHtml.innerHTML = content;

  // Verificar si existe al menos un elemento con la clase '.limit_date_moth_inicio'
  if (document.querySelector('.limit_date_moth_inicio')) {
    // Si existe, añadir el evento 'change'
    document.querySelector('.limit_date_moth_inicio').addEventListener('change', ValidarFechasMes);
  }



}

function ValidarFechasMes() {
  const fechaInicial = document.querySelector('.limit_date_moth_inicio').value;
  const fechaFinal = document.querySelector('.limit_date_moth_final');

  // Obtener los valores como objetos Date
  const dateInicial = new Date(fechaInicial);
  const dateFinal = new Date(fechaFinal.value);

  // Verificar si fechaFinal es mayor que fechaInicial
  if (dateFinal >= dateInicial) {
      // No blanquear el valor del input fechaFinal
  } else {
      // Blanquear el valor del input fechaFinal
      fechaFinal.value = "";
  }

  const date = new Date(fechaInicial);
  date.setDate(date.getDate() + 1);

  const primerDia = new Date(date.getFullYear(), date.getMonth(), 1);
  const ultimoDia = new Date(date.getFullYear(), date.getMonth() + 1, 0);

  const dateFormat1 = ultimoDia.toISOString().split('T')[0];

  // Obtener la fecha actual en formato 'YYYY-MM-DD'
  const today = new Date().toISOString().split('T')[0];

  // Comparar si dateFormat1 es mayor que la fecha actual
  if (dateFormat1 > today) {
      fechaFinal.setAttribute('max', today); // Establecer la fecha máxima como la fecha actual
  } else {
      fechaFinal.setAttribute('max', dateFormat1); // Establecer la fecha máxima como dateFormat1
  }

  // Establecer la fecha mínima como fechaInicial
  fechaFinal.setAttribute('min', fechaInicial);
}




export async function procesarConsulta(cliente_id, cookies, objeto) {
  // Obtener cookies y objeto
  var cookiesObject = JSON.parse(cookies);

  // Nombre de almacenamiento local
  let storageName_tipoBusqueda = `data_tipoBusqueda_${cliente_id}`;

  // Obtener datos de localStorage si están disponibles
  let storage_tipoBusqueda = JSON.parse(localStorage.getItem(storageName_tipoBusqueda));

  // Variable para almacenar datos
  var data;
  var created_at = '';

  // Obtener todos los parámetros de la query
  let dataParams = getAllQueryParams();

  // Verificar si cliente_id está presente
  if (cliente_id) {
      // Usar datos almacenados si están disponibles
      if (storage_tipoBusqueda) {
          data = storage_tipoBusqueda;
      }

      // Llamar a la API para obtener datos actualizados
      const responseData = await apiController(import.meta.env.PUBLIC_BASE_URL, `/consultas/cliente/${cliente_id}/${cookiesObject.rol_id}`, 'GET', null, cookiesObject.token);
      
      // Procesar la respuesta de la API
      if (responseData.data.errors || responseData.code !== 200) {
          console.log(responseData.data.errors);
      } else {
          // Almacenar datos y guardar en localStorage
          data = responseData.data;
          created_at = responseData.others.created_at
          localStorage.setItem(storageName_tipoBusqueda, JSON.stringify(data));
      }

      // Llenar el select .tipoBusqueda con las opciones disponibles
      var selectTipoBusqueda = document.querySelector('.tipoBusqueda');
      selectTipoBusqueda.innerHTML = '';

      // Crear la opción deshabilitada
      var defaultOption = document.createElement('option');
      defaultOption.value = '';
      defaultOption.text = 'Seleccionar';
      defaultOption.disabled = true;
      defaultOption.selected = true;
      selectTipoBusqueda.appendChild(defaultOption);

      // Agregar las opciones disponibles desde los datos
      data.forEach(item => {
          var option = document.createElement('option');
          option.value = item.id;
          option.text = item.nombre;
          selectTipoBusqueda.appendChild(option);
      });

      // Obtener el valor de tipoBusqueda de los parámetros de la query
      let tipoBusqueda = getQueryParam('tipoBusqueda');

      // Seleccionar la opción correspondiente en el select
      let selectElement = document.querySelector('.tipoBusqueda');
      for (let i = 0; i < selectElement.options.length; i++) {
          if (selectElement.options[i].value == tipoBusqueda) {
              selectElement.options[i].selected = true;
              handleSelectChange(tipoBusqueda,data,created_at);

              // Establecer los valores de los elementos según los parámetros de la query
              for (const [key, value] of Object.entries(dataParams)) {
                  setElementValueByName(key, value);
              }
              break;
          }
      }

      // Escuchar cambios en el select tipoBusqueda
      selectTipoBusqueda.addEventListener('change', function() {
          handleSelectChange(this.value, data,created_at);
      });
  }
}

export function buscarYResaltar(valor) {
  // Selecciona todas las filas en la tabla
  
      var filas = document.querySelectorAll('.tableBusqueda tr');

      // Selecciona el div que contiene la tabla
      var div = document.querySelector('.div_tableBusqueda');

      // Itera sobre las filas
      for (var i = 0; i < filas.length; i++) {
          // Si la fila contiene el número de control
          if (filas[i].textContent.includes(valor)) {
              // Pinta la fila de azul
              filas[i].style.backgroundColor = '#4e4f9d';
              filas[i].classList.add('text-white');
              // Enfoca la fila en el div
              div.scrollTop = filas[i].offsetTop - div.offsetTop - div.clientHeight / 2 + filas[i].clientHeight / 2;
          }
      }
  
}


export function getTableData(tableId) {
  const table = document.getElementById(tableId);
  if (!table) {
    console.error(`La tabla con el id "${tableId}" no se encuentra.`);
    return null;
  }

  const isVisible = (element) => {
    return !element.hasAttribute('hidden');
  };

  const headers = Array.from(table.querySelectorAll('thead th'))
    .slice(1) // Omitir la primera columna
    .filter(th => isVisible(th))
    .map(th => th.innerText.trim());

  const rows = Array.from(table.querySelectorAll('tbody tr')).map(tr => 
    Array.from(tr.querySelectorAll('td'))
    .filter(td => isVisible(td))
    .slice(1) // Omitir la primera columna
      .map(td => td.innerText.trim())
  );

  return {
    columns: headers,
    body: rows,
  };
}


export async function downloadReporte(ruta_servicio, requestBody, token, method = 'POST') {
  if (!requestBody) {
    console.error('No se pudieron obtener los datos.');
    return;
  }

  try {
    const response = await apiController(import.meta.env.PUBLIC_BASE_URL, ruta_servicio, method, requestBody, token, 'application/json', true);
    if (response.blob) {
      const url = window.URL.createObjectURL(new Blob([response.blob], { type: 'application/pdf' }));
      const link = document.createElement('a');
      link.href = url;
      link.setAttribute('download', response.filename || 'reporte.pdf');
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
    } else {
      console.error('Error en la respuesta del servidor:', response);
    }
  } catch (error) {
    console.error('Error al enviar los datos de la tabla al servidor:', error);
  }
}

export async function getIpClient() {
  let cookies = obtenerCookie('IpClient');
	if(cookies == null){
		try {
      const response = await fetch("https://api.ipify.org?format=json");
      const data = await response.json();
      const ipAddress = data.ip;
      document.cookie = `IpClient=${ipAddress}; max-age=3600;`;
    } catch (error) {
      console.error(error);
    }
	}
  
}

export function filterConfigByAvailable(config, name) {
  return config.filter(item => {
      // Si 'available' no está presente, se considera disponible
      if (!item.available) return true;
      // Verifica si el nombre está en el array de 'available'
      return item.available.includes(name);
  });
}

export function countWithoutAvailable(config) {
  return config.reduce((count, item) => {
      // Si 'available' no está presente, incrementa el contador
      if (!item.available) {
          count++;
      }
      return count;
  }, 0);
}

export function capitalizeFirstWord(str) {
  if (!str) return str;
  // Dividir la cadena en palabras
  let words = str.split(' ');
  // Capitalizar la primera palabra y poner las demás en minúsculas
  words = words.map((word, index) => index === 0 ? word.charAt(0).toUpperCase() + word.slice(1).toLowerCase() : word.toLowerCase());
  // Unir las palabras de nuevo en una cadena
  return words.join(' ');
}