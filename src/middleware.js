import { sequence } from "astro:middleware";
import jwt from 'jsonwebtoken';

export function onRequest ({ locals, request, url, cookies}, next) {
    
    
    let isPrivate = [
        '/auth/selectedAction',
        '/dashboard',
        '/usuarios',
        '/dashboardSearch',
    ];
    let path = url.pathname;
 
    if (isPrivate.includes(path)) {
        let session = cookies.get('session');
        console.log("paso 1",session);
        if (!session) {
           // Si no hay sesión, redirige al usuario a la raíz
           return new Response(null, {status: 302, headers: {'Location': '/'}});
        }
        session = JSON.parse(session.value);
       
        try {
        console.log("paso 2");

            jwt.verify(session.token, 'secretKey', (err, decodedToken) => {
                if (err) {
                    console.log('error token: ', err);
                    return new Response(null, {status: 302, headers: {'Location': '/'}});
                } else {
        console.log("paso 3");

                    return next();
                }
            });
        } catch (err) {
        console.log("paso 5");

            // Si el token es inválido, redirige al usuario a la raíz
            return new Response(null, {status: 302, headers: {'Location': '/'}});
        }
    } else {
        return next();
       
    }
}
