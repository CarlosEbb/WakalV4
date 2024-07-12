// translation.js
export const dictionary = {
    '/consultasCliente/getDataBusqueda': 'Búsqueda de datos del cliente',
    '/consultasCliente': 'Consultas de cliente',
    'tipoBusqueda': 'tipo de búsqueda',
    'tipo_documento': 'tipo de documento',
    'tipo_fecha': 'tipo de fecha',
    'fecha_inicio': 'fecha de inicio',
    'fecha_final': 'fecha final',
    '/auditorias': 'Ver Historial de Actividades',
    '/usuarios': 'Ver Listado de usuarios',
  };
  
  const omittedKeys = ['limit', 'offset', 'c', 'tipoBusqueda']; // Claves a omitir
  
  export function translateUrl(inputUrl) {
    const parsedUrl = new URL(inputUrl, 'http://example.com'); // Base URL dummy
    const pathname = parsedUrl.pathname;
    const searchParams = new URLSearchParams(parsedUrl.search);
    const query = Object.fromEntries(searchParams.entries());
    const pathSegments = pathname.split('/').filter(Boolean);
  
    // Reemplazar las palabras clave definidas en el diccionario
    let translatedPath = pathSegments.map(segment => {
      return dictionary[`/${segment}`] || segment;
    }).join(' ');
  
    // Crear la traducción para los parámetros de búsqueda, omitiendo las claves definidas
    let translatedParams = Object.entries(query).map(([key, value]) => {
      if (omittedKeys.includes(key)) return ''; // Omitir las claves definidas en omittedKeys
      let translatedKey = dictionary[key] || key;
      let translatedValue = value === 'all' ? 'todos' : value;
      return `${translatedKey} ${translatedValue}`;
    }).filter(Boolean).join(', ');
  
    // Juntar path y parámetros de búsqueda
    return `${translatedPath}${translatedParams ? ' con ' + translatedParams : ''}`;
  }
  
  // Función que traduce un método de auditoría a su equivalente en español
  export function translateMethod(metodo) {
    const auditoriaMethods = {
        GET: 'Obtener',
        PUT: 'Actualizar',
        POST: 'Crear',
        DELETE: 'Eliminar'
    };
    // Convierte el método a mayúsculas para asegurar coincidencia
    metodo = metodo.toUpperCase();

    // Verifica si el método existe en el diccionario
    if (auditoriaMethods.hasOwnProperty(metodo)) {
        return auditoriaMethods[metodo];
    } else {
        return 'Método no encontrado'; // O maneja el caso de error según tu necesidad
    }
}

export function formatJSON(jsonString) {
    try {
      const jsonObject = JSON.parse(jsonString);
      // Eliminar las claves "password" y "newPassword" si están presentes
      delete jsonObject.password;
      delete jsonObject.newPassword;
  
      let formattedString = '';
      const keys = Object.keys(jsonObject);
      keys.forEach((key, index) => {
        formattedString += `"${key}": ${JSON.stringify(jsonObject[key], null, 2)}`;
        if (index < keys.length - 1) {
          formattedString += ',';
        }
        formattedString += '\n';
      });
      return formattedString;
    } catch (error) {
      console.error('Error parsing JSON:', error);
      return null;
    }
  }