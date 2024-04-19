import moment from 'moment';
import 'moment/locale/es';  // Importa el locale español

export function convertDateTime(dateTime,format) {
    // Establece el locale a español
    moment.locale('es');

    // Convertir la fecha y hora al formato deseado
    let convertedDateTime = moment(dateTime, 'YYYY-MM-DD HH:mm:ss.SSSS').format(format);

    return convertedDateTime;
}
