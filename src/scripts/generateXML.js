import {create} from "xmlbuilder2";

export function generateXML(dataTable) {
    const doc = create({ version: '1.0', encoding: 'UTF-8' })
      .ele('CLIENTES');
    
    dataTable.forEach((data, index) => {
      doc.ele(`CLIENTE${index + 1}`)
        .ele('RIFPrestador').txt('J-003274445').up()
        .ele('TipoDocumento').txt(data.tipo_documento).up()
        .ele('NumeroDocumento').txt(data.numero_documento).up()
        .ele('FechaDocumento').txt(data.fecha_emision).up()
        .ele('HoraEmision').txt(data.hora_emision).up()
        .ele('RIFCliente').txt(data.rif).up()
        .ele('CodigoOperacion').txt(data.codigo_operacion).up()
        .ele('Precio').txt(data.neto_pagar).up()
        .ele('MontoBaseImponibleIVA').txt(data.base_imponible).up()
        .ele('MontoIVA').txt(data.monto_iva).up()
        .ele('totalExento').txt(data.monto_exento).up()
        .ele('totalAPagar').txt(data.total_pagar).up()
        .ele('MontoIGTF').txt(data.igtf).up()
        .up();
    });
    
    return doc.end({ prettyPrint: true });
}

export function downloadXML(xml, filename) {
    console.log(1111);
    console.log(xml);
    const blob = new Blob([xml], { type: 'application/xml' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = filename;
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    URL.revokeObjectURL(url);
}