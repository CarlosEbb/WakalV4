import { sequence } from "astro:middleware";
import jwt from 'jsonwebtoken';

export async function onRequest({ locals, request, url, cookies }, next) {
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
                    Location: '/'
                }
            });
        }

        session = JSON.parse(session.value);

        try {

            const decodedToken = await new Promise((resolve, reject) => {
                jwt.verify(session.token, import.meta.env.JWT_SECRET, (err, decoded) => {
                    if (err) {
                        cookies.set('msg_error', 'La sesión ha caducado por inactividad. Acceda nuevamente para retomar sus actividades', { path: '/', httpOnly: false });
                        reject(err);
                    } else {
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
                    Location: '/'
                }
            });
        }
    } else {
        return next();
    }
}
