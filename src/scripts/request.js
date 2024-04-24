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
