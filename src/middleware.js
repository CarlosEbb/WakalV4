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
            console.log("pasooo 1: ", session);
           // Si no hay sesión, redirige al usuario a la raíz
           return new Response(null, {status: 302, headers: {'Location': '/'}});
        }
        session = JSON.parse(session.value);
       
        try {


            jwt.verify(session.token, 'secretKey', (err, decodedToken) => {
                if (err) {
                    console.log("pasooo 2");
                    return new Response(null, {status: 302, headers: {'Location': '/'}});
                } else {

                    return next();
                }
            });
        } catch (err) {
            console.log("pasooo 3");
            // Si el token es inválido, redirige al usuario a la raíz
            return new Response(null, {status: 302, headers: {'Location': '/'}});
        }
    } else {
        return next();
       
    }
}