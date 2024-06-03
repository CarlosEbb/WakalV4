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
  const { placeholder, values } = data;
  const stringValueToFind = String(valueToFind); // Convertir el valor a buscar a cadena

  for (let i = 0; i < values.length; i++) {
    // Convertir cada valor en el array a cadena y verificar si coincide
    if (values[i].some(value => String(value) === stringValueToFind)) {
      return placeholder[i];
    }
  }

  return null; // Si no se encuentra el valor
}