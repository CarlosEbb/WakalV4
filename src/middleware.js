import { sequence } from "astro:middleware";
import jwt from 'jsonwebtoken';

const securityHeaders = {
    //'Content-Security-Policy': "default-src 'self';base-uri 'self';font-src 'self' https: data:;form-action 'self';frame-ancestors 'self';img-src 'self' data:;object-src 'none';script-src 'self';script-src-attr 'none';style-src 'self' https: 'unsafe-inline';upgrade-insecure-requests",
    //'X-DNS-Prefetch-Control': 'off',
    //'Expect-CT': "max-age=0",
    //'X-Frame-Options': 'SAMEORIGIN',
    //'Strict-Transport-Security': "max-age=15552000; includeSubDomains",
    //'X-Download-Options': 'noopen',
    //'X-Content-Type-Options': 'nosniff',
    //'Referrer-Policy': 'no-referrer',
    //'X-Permitted-Cross-Domain-Policies': 'none',
    'X-XSS-Protection': "0",
    'Feature-Policy': "camera 'none'; geolocation 'none'; microphone 'none'",
};

export async function onRequest({ locals, request, url, cookies, response }, next) {

    let isPrivate = [
        '/auth/selectedAction',
    ];
    let path = url.pathname;

    if (path.includes('/dashboard') || isPrivate.includes(path)) {

        let session = cookies.get('session');
        if (!session) {
            return new Response(null, {
                status: 302,
                headers: {
                    ...securityHeaders,
                    Location: '/',
                }
            });
        }

        session = JSON.parse(session.value);

        try {
            console.log(url.pathname);
            const decodedToken = await new Promise((resolve, reject) => {
                jwt.verify(session.token, import.meta.env.JWT_SECRET, (err, decoded) => {
                    
                    if (err) {
                        cookies.set('msg_error', 'La sesión ha caducado por inactividad. Acceda nuevamente para retomar sus actividades', { path: '/', httpOnly: false });
                        reject(err);
                    } else {
                        //renovar el token
                        resolve(decoded);
                    }
                });
            });

            // Agrega el token a locals
            locals.token = session.token;
            locals.rol_id = session.rol_id;
            locals.cliente_id = session.cliente_id;
            locals.logo = session.logo;
            locals.is_tour = session.is_tour;
            
            return next();
        } catch (err) {
            return new Response(null, {
                status: 302,
                headers: {
                    ...securityHeaders,
                    Location: '/'
                }
            });
        }
    } else {
        const response = await next();
        // Aplica los encabezados de seguridad
        return applySecurityHeaders(response);
    }
}


function applySecurityHeaders(response) {
   
    const newHeaders = new Headers(response.headers);
    Object.entries(securityHeaders).forEach(([key, value]) => {
        newHeaders.set(key, value);
    });
    return new Response(response.body, {
        status: response.status,
        headers: newHeaders,
    });
}