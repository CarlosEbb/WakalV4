import {create} from "xmlbuilder2";

export function generateXML(dataTable) {
    const doc = create({ version: '1.0', encoding: 'UTF-8' })
      .ele('CLIENTES');
    
    dataTable.forEach((data, index) => {
      doc.ele(`CLIENTE${index + 1}`)
        .ele('RIFPrestador').txt(data.RIFPrestador).up()
        .ele('TipoDocumento').txt(data.TipoDocumento).up()
        .ele('NumeroDocumento').txt(data.NumeroDocumento).up()
        .ele('FechaDocumento').txt(data.FechaDocumento).up()
        .ele('HoraEmision').txt(data.HoraEmision).up()
        .ele('RIFCliente').txt(data.RIFCliente).up()
        .ele('CodigoOperacion').txt(data.CodigoOperacion).up()
        .ele('Precio').txt(data.Precio).up()
        .ele('MontoBaseImponibleIVA').txt(data.MontoBaseImponibleIVA).up()
        .ele('MontoIVA').txt(data.MontoIVA).up()
        .ele('totalExento').txt(data.totalExento).up()
        .ele('totalAPagar').txt(data.totalAPagar).up()
        .ele('MontoIGTF').txt(data.MontoIGTF).up()
        .up();
    });
    
    return doc.end({ prettyPrint: true });
}

export function collectRowData(row) {
  return {
      RIFPrestador: row.querySelector('.rif_prestador').innerText,
      TipoDocumento: row.querySelector('.tipo_documento').innerText,
      NumeroDocumento: row.querySelector('.numero_documento').innerText,
      FechaDocumento: row.querySelector('.fecha_emision').innerText,
      HoraEmision: row.querySelector('.hora_emision').innerText,
      RIFCliente: row.querySelector('.rif').innerText, // Asegúrate de usar la clase correcta si hay otra para RIFCliente
      CodigoOperacion: row.querySelector('.codigo_operacion').innerText,
      Precio: row.querySelector('.neto_pagar').innerText, // Asegúrate de que esta clase sea correcta
      MontoBaseImponibleIVA: row.querySelector('.base_imponible').innerText,
      MontoIVA: row.querySelector('.monto_iva').innerText,
      totalExento: row.querySelector('.monto_exento').innerText,
      totalAPagar: row.querySelector('.total_pagar').innerText,
      MontoIGTF: row.querySelector('.igtf').innerText
  };
}

export function downloadXML(xml, filename) {
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