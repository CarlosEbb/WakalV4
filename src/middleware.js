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
           // Si no hay sesión, redirige al usuario a la raíz
           return new Response(null, {status: 302, headers: {'Location': '/'}});
        }
        session = JSON.parse(session.value);
       
        try {
            jwt.verify(session.token, 'secretKey', (err, decodedToken) => {
                if (err) {
                    return new Response(null, {status: 302, headers: {'Location': '/'}});
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
            // Si el token es inválido, redirige al usuario a la raíz
            return new Response(null, {status: 302, headers: {'Location': '/'}});
        }
    } else {
        return next();
       
    }
}
