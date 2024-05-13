import { sequence } from "astro:middleware";
import jwt from 'jsonwebtoken';

export function onRequest ({ locals, request, url, cookies}, next) {
    let isPrivate = [
        '/auth/selectedAction',
    ];
    let path = url.pathname;

    if (path.includes('/dashboard') || isPrivate.includes(path)) {
        
        let session = cookies.get('session');
        if (!session) {
            const modifiedResponse = new Response(nextResponse.body, {
                ...nextResponse.headers,
                headers: {
                ...nextResponse.headers.headers,
                Location: '/',
                },
            });

            return modifiedResponse;
        }
        session = JSON.parse(session.value);
       
        try {
            jwt.verify(session.token, 'secretKey', (err, decodedToken) => {
                if (err) {

                    const modifiedResponse = new Response(nextResponse.body, {
                        ...nextResponse.headers,
                        headers: {
                        ...nextResponse.headers.headers,
                        Location: '/',
                        },
                    });

                    return modifiedResponse;
                  
                } else {
                    // Agrega el token a locals
                    locals.token = session.token;
                    locals.rol_id = session.rol_id;
                    locals.cliente_id = session.cliente_id;
                    locals.logo = session.logo;

                    return next();
                }
            });
        } catch (err) {
            const modifiedResponse = new Response(nextResponse.body, {
                ...nextResponse.headers,
                headers: {
                ...nextResponse.headers.headers,
                Location: '/',
                },
            });

            return modifiedResponse;
        }
    } else {
        return next();
       
    }

}
