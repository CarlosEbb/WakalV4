import {create} from "xmlbuilder2";

export function generateXML(dataTable) {
  const doc = create({ version: '1.0', encoding: 'UTF-8' })
      .ele('CLIENTES');

  dataTable.forEach((data, index) => {
      const cliente = doc.ele(`CLIENTE${index + 1}`);
      
      Object.keys(data).forEach(key => {
          if (data[key] !== undefined && data[key] !== null) {
              cliente.ele(key).txt(data[key]).up();
          }
      });
  });

  return doc.end({ prettyPrint: true });
}

export function collectRowData(row) {
  const data = {};

  const rifPrestador = row.querySelector('.rif_prestador');
  if (rifPrestador) data.RIFPrestador = rifPrestador.innerText;

  const tipoDocumento = row.querySelector('.tipo_documento');
  if (tipoDocumento) data.TipoDocumento = tipoDocumento.innerText;

  const numeroDocumento = row.querySelector('.numero_documento');
  if (numeroDocumento) data.NumeroDocumento = numeroDocumento.innerText;

  const fechaDocumento = row.querySelector('.fecha_emision');
  if (fechaDocumento) data.FechaDocumento = fechaDocumento.innerText;

  const horaEmision = row.querySelector('.hora_emision');
  if (horaEmision) data.HoraEmision = horaEmision.innerText;

  const rifCliente = row.querySelector('.rif');
  if (rifCliente) data.RIFCliente = rifCliente.innerText;

  const codigoOperacion = row.querySelector('.codigo_operacion');
  if (codigoOperacion) data.CodigoOperacion = codigoOperacion.innerText;

  const precio = row.querySelector('.neto_pagar');
  if (precio) data.Precio = precio.innerText;

  const montoBaseImponibleIVA = row.querySelector('.base_imponible');
  if (montoBaseImponibleIVA) data.MontoBaseImponibleIVA = montoBaseImponibleIVA.innerText;

  const montoIVA = row.querySelector('.monto_iva');
  if (montoIVA) data.MontoIVA = montoIVA.innerText;

  const totalExento = row.querySelector('.monto_exento');
  if (totalExento) data.totalExento = totalExento.innerText;

  const totalAPagar = row.querySelector('.total_pagar');
  if (totalAPagar) data.totalAPagar = totalAPagar.innerText;

  const montoIGTF = row.querySelector('.igtf');
  if (montoIGTF) data.MontoIGTF = montoIGTF.innerText;

  // Datos adicionales
  const nombreUsuario = row.querySelector('.nombre_usuario');
  if (nombreUsuario) data.NombreUsuario = nombreUsuario.innerText;

  const username = row.querySelector('.username');
  if (username) data.Username = username.innerText;

  const nombreRol = row.querySelector('.nombre_rol');
  if (nombreRol) data.NombreRol = nombreRol.innerText;

  const ruta = row.querySelector('.ruta');
  if (ruta) data.Ruta = ruta.innerText;

  const fecha = row.querySelector('.fecha');
  if (fecha) data.Fecha = fecha.innerText;

  const hora = row.querySelector('.hora');
  if (hora) data.Hora = hora.innerText;

  return data;
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

export function generarXMLIndividual(row) {
  const rowData = collectRowData(row);
  const xml = generateXML([rowData]);
  downloadXML(xml, `XML-DOC-${rowData.NumeroDocumento}.xml`);
}