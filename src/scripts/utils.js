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

export async function actualizarDatos(token, url, clase) {
    let totalCard1Cache = localStorage.getItem('total_'+clase);
    const responseData = await apiController(import.meta.env.PUBLIC_BASE_URL,url,'GET',null,token);
    if (responseData.data && responseData.data.total) {
      incrementoNumerico(totalCard1Cache, parseInt(responseData.data.total), clase);
      localStorage.setItem('total_'+clase, responseData.data.total);
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

export function formatearNumero(valor) {
  return Math.floor(valor).toLocaleString('de-DE')
}

export function formatearNumeroControl(num) {
  let str = num.toString();
  while (str.length < 10) {
      str = '0' + str;
  }
  return str.slice(0, 2) + '-' + str.slice(2);
}

export function setInputValueByName(name, value) {
  var inputElement = document.querySelector('input[name="' + name + '"]');
  if (inputElement) {
      inputElement.value = value;
  } else {
      console.log('No se encontró ningún input con el nombre "' + name + '".');
  }
}