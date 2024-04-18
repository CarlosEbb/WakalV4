export async function apiController(baseURL, endpoint, method, requestBody) {
  try {
    
    const url = `${baseURL}${endpoint}`;
    const options = {
      method,
      headers: {
        'Content-Type': 'application/json',
      },
      body: requestBody ? JSON.stringify(requestBody) : null,
    };
    
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