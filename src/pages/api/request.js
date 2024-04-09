export async function apiController(baseURL, endpoint, method, requestBody) {
    try {
      // Construye la URL completa utilizando la URL base y el endpoint proporcionado
      const url = `${baseURL}${endpoint}`;
  
      // Define las opciones de la solicitud
      const options = {
        method, // Utiliza el método pasado como parámetro
        headers: {
          'Content-Type': 'application/json', // Tipo de contenido del cuerpo de la solicitud
        },
        body: requestBody ? JSON.stringify(requestBody) : null, // Convierte el objeto de requestBody a formato JSON si está presente
      };
  
      // Realiza la solicitud a la API utilizando fetch con las opciones especificadas
      const response = await fetch(url, options);
  
      // Parsea la respuesta como JSON
      const responseParse = await response.json();
      const data = responseParse.data;
     

      // Verifica si la solicitud fue exitosa (código de estado 2xx)
      if (response.ok) {
         // Almacena el token JWT en localStorage
         alert(JSON.stringify(data.token));
         //localStorage.setItem('token', response.token);
        // Si la solicitud es exitosa, devuelve los datos de respuesta obtenidos de la API
        return true;
      } else {
         // Obtiene el array de errores
         const errors = data.errors;
         // Muestra los errores en un alert
         alert(errors.join('\n'));
         return false;
      }
    } catch (error) {
      // Obtiene el array de errores
      const errors = error.response.data.errors;
      // Muestra los errores en un alert
      alert(errors.join('\n'));
      return false;
    }
  }