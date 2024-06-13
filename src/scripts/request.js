export async function apiController(baseURL, endpoint, method, requestBody, token = null, contentType = 'application/json') {
  try {
    const url = `${baseURL}${endpoint}`;
    let headers = {};
    if (token) {
      headers['Authorization'] = 'Bearer ' + token;
    }
    const options = {
      method,
      headers: headers,
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