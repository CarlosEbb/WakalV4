export async function apiController(baseURL, endpoint, method, requestBody, token = null) {
  try {
    const url = `${baseURL}${endpoint}`;
    let headers = {
      'Content-Type': 'application/json'
    };
    if (token) {
      headers['Authorization'] = 'Bearer ' + token;
    }
    const options = {
      method,
      headers: headers,
    };
    
    if (method !== 'GET' && method !== 'HEAD' && requestBody) {
      options.body = JSON.stringify(requestBody);
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
