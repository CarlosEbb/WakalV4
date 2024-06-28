// Función para obtener el token CSRF desde el servicio
async function obtenerCSRFToken(baseURL) {
  try {
    const response = await fetch(baseURL+'/csrf-token', {
      credentials: 'include'  // Indicar al navegador que incluya cookies y credenciales
    });
    if (!response.ok) {
      throw new Error('Failed to obtain CSRF token');
    }
    const data = await response.json();
    return data.csrfToken;
  } catch (error) {
    console.error('Error fetching CSRF token:', error);
    throw error;
  }
}

// Función para realizar solicitudes con CSRF
export async function apiController(baseURL, endpoint, method, requestBody, token = null, contentType = 'application/json') {
  try {
    // Obtener el token CSRF
    const csrfToken = await obtenerCSRFToken(baseURL);
    
    const url = `${baseURL}${endpoint}`;
    let headers = {};
    
    if (token) {
      headers['Authorization'] = 'Bearer ' + token;
    }
    
    // Agregar el token CSRF a los encabezados
    headers['csrf-token'] = csrfToken;

    const options = {
      method,
      headers: headers,
      credentials: 'include'  // Indicar al navegador que incluya cookies y credenciales
    };
    
    if (method !== 'GET' && method !== 'HEAD' && requestBody) {
      if (requestBody instanceof FormData || contentType === 'multipart/form-data') {
        options.body = requestBody;
      } else {
        headers['Content-Type'] = contentType;
        options.body = JSON.stringify(requestBody);
      }
    }
    
    const response = await fetch(url, options);
    const responseParse = await response.json();

    if (response.ok) {
      return responseParse;
    } else {
      return responseParse;
    }
  } catch (error) {
    return error;
  }
}


export function formDataToObject(formData) {
  const data = {};

  for (let [key, value] of formData.entries()) {
    if (key.endsWith('[]')) {
      const arrayKey = key.slice(0, -2); // Elimina los últimos dos caracteres '[]'
      if (!data[arrayKey]) {
        data[arrayKey] = []; // Inicializa el arreglo si aún no existe
      }
      data[arrayKey].push(value); // Agrega el valor al arreglo
    } else {
      data[key] = value; // Asigna el valor directamente si no es un campo múltiple
    }
  }

  return data;
}