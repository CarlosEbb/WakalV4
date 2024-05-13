INSERT INTO "dba"."parametros" ("id","name","tipo_input","placeholder","column_reference_cliente") VALUES(1,'numero_control','text','Número de Control','');
INSERT INTO "dba"."parametros" ("id","name","tipo_input","placeholder","column_reference_cliente") VALUES(2,'numero_documento','text','Número de Documento','');
INSERT INTO "dba"."parametros" ("id","name","tipo_input","placeholder","column_reference_cliente") VALUES(3,'tipo_documento','selected','Tipo Documento','');
INSERT INTO "dba"."parametros" ("id","name","tipo_input","placeholder","column_reference_cliente") VALUES(4,'fecha_inicio','date','Fecha Inicial','');
INSERT INTO "dba"."parametros" ("id","name","tipo_input","placeholder","column_reference_cliente") VALUES(5,'fecha_final','date','Fecha Final','');
INSERT INTO "dba"."parametros" ("id","name","tipo_input","placeholder","column_reference_cliente") VALUES(6,'rif','text','Número de RIF','');
INSERT INTO "dba"."parametros" ("id","name","tipo_input","placeholder","column_reference_cliente") VALUES(7,'codigo_operacion','date','Código de Operación','');
INSERT INTO "dba"."parametros" ("id","name","tipo_input","placeholder","column_reference_cliente") VALUES(8,'razon_social','text','Razón Social','');
INSERT INTO "dba"."parametros" ("id","name","tipo_input","placeholder","column_reference_cliente") VALUES(9,'serie','selected','Serie','');
INSERT INTO "dba"."parametros" ("id","name","tipo_input","placeholder","column_reference_cliente") VALUES(10,'numero_suscriptor','text','Número de Suscriptor/Cliente','');

--CLIENTE 1 CIRION

INSERT INTO "dba"."consultas" ("id","nombre","cliente_id") VALUES(1,'Número de Control',1);
INSERT INTO "dba"."consultas" ("id","nombre","cliente_id") VALUES(2,'Número de Documento',1);
INSERT INTO "dba"."consultas" ("id","nombre","cliente_id") VALUES(3,'Tipo de Documento',1);
INSERT INTO "dba"."consultas" ("id","nombre","cliente_id") VALUES(4,'Número de Rif/CI',1);
INSERT INTO "dba"."consultas" ("id","nombre","cliente_id") VALUES(5,'Código de Operación',1);
INSERT INTO "dba"."consultas" ("id","nombre","cliente_id") VALUES(6,'Nombre o razón social',1);
INSERT INTO "dba"."consultas" ("id","nombre","cliente_id") VALUES(7,'Fecha de Emisión',1);
INSERT INTO "dba"."consultas" ("id","nombre","cliente_id") VALUES(9,'Fecha de Asignación',1);
INSERT INTO "dba"."consultas" ("id","nombre","cliente_id") VALUES(11,'Serie',1);
INSERT INTO "dba"."consultas" ("id","nombre","cliente_id") VALUES(12,'Número de Cliente/Suscriptor',1);

INSERT INTO "dba"."consultas_parametros" ("consulta_id","parametro_id") VALUES(1,1);
INSERT INTO "dba"."consultas_parametros" ("consulta_id","parametro_id") VALUES(2,2);
INSERT INTO "dba"."consultas_parametros" ("consulta_id","parametro_id") VALUES(5,7);
INSERT INTO "dba"."consultas_parametros" ("consulta_id","parametro_id") VALUES(6,8);
INSERT INTO "dba"."consultas_parametros" ("consulta_id","parametro_id") VALUES(7,4);
INSERT INTO "dba"."consultas_parametros" ("consulta_id","parametro_id") VALUES(7,5);
INSERT INTO "dba"."consultas_parametros" ("consulta_id","parametro_id") VALUES(9,4);
INSERT INTO "dba"."consultas_parametros" ("consulta_id","parametro_id") VALUES(9,5);
INSERT INTO "dba"."consultas_parametros" ("consulta_id","parametro_id") VALUES(12,10);
INSERT INTO "dba"."consultas_parametros" ("consulta_id","parametro_id") VALUES(5,4);
INSERT INTO "dba"."consultas_parametros" ("consulta_id","parametro_id") VALUES(5,5);
INSERT INTO "dba"."consultas_parametros" ("consulta_id","parametro_id") VALUES(6,4);
INSERT INTO "dba"."consultas_parametros" ("consulta_id","parametro_id") VALUES(6,5);
INSERT INTO "dba"."consultas_parametros" ("consulta_id","parametro_id") VALUES(12,4);
INSERT INTO "dba"."consultas_parametros" ("consulta_id","parametro_id") VALUES(12,5);
INSERT INTO "dba"."consultas_parametros" ("consulta_id","parametro_id") VALUES(3,3);
INSERT INTO "dba"."consultas_parametros" ("consulta_id","parametro_id") VALUES(3,4);
INSERT INTO "dba"."consultas_parametros" ("consulta_id","parametro_id") VALUES(3,5);
INSERT INTO "dba"."consultas_parametros" ("consulta_id","parametro_id") VALUES(4,6);
INSERT INTO "dba"."consultas_parametros" ("consulta_id","parametro_id") VALUES(4,4);
INSERT INTO "dba"."consultas_parametros" ("consulta_id","parametro_id") VALUES(4,5);
INSERT INTO "dba"."consultas_parametros" ("consulta_id","parametro_id") VALUES(11,9);
INSERT INTO "dba"."consultas_parametros" ("consulta_id","parametro_id") VALUES(11,4);
INSERT INTO "dba"."consultas_parametros" ("consulta_id","parametro_id") VALUES(11,5);


--otros clientes temporal, cambiar el cliente_id por el que corresponda

INSERT INTO "dba"."consultas" ("nombre","cliente_id") VALUES('Número de Documento',3);
INSERT INTO "dba"."consultas_parametros" ("consulta_id","parametro_id") VALUES(@@identity,1);


--- cliente_id en la tabla relacionada
CREATE TABLE "dba"."consultas" (
	"id" BIGINT NOT NULL DEFAULT AUTOINCREMENT UNIQUE,
	"nombre" VARCHAR(255) NULL,
	"tituloCard" VARCHAR(255) NULL,
	"created_at" TIMESTAMP NULL DEFAULT CURRENT TIMESTAMP,
	"updated_at" TIMESTAMP NULL DEFAULT CURRENT TIMESTAMP,
	"tipo_consulta_id" BIGINT NULL,
	"cliente_id" BIGINT NULL,
	PRIMARY KEY ( "id" ASC )
) IN "system";
CREATE TABLE "dba"."consultas_parametros" (
	"id" BIGINT NOT NULL DEFAULT AUTOINCREMENT UNIQUE,
	"consulta_id" BIGINT NOT NULL,
	"parametro_id" BIGINT NOT NULL,
	"created_at" TIMESTAMP NULL DEFAULT CURRENT TIMESTAMP,
	"updated_at" TIMESTAMP NULL DEFAULT CURRENT TIMESTAMP,
	PRIMARY KEY ( "id" ASC )
) IN "system";
CREATE TABLE "dba"."parametros" (
	"id" BIGINT NOT NULL DEFAULT AUTOINCREMENT UNIQUE,
	"name" VARCHAR(255) NOT NULL,
	"tipo_input" VARCHAR(255) NOT NULL,
	"titulo" VARCHAR(255) NOT NULL,
	"placeholder" VARCHAR(255) NULL,
	"created_at" TIMESTAMP NULL DEFAULT CURRENT TIMESTAMP,
	"updated_at" TIMESTAMP NULL DEFAULT CURRENT TIMESTAMP,
	PRIMARY KEY ( "id" ASC )
) IN "system";



---tabla cirion

(     SELECT  control, CONVERT(VARCHAR(255), nro_documento) AS nro_documento, CR15_tipoCom, CR03_numIden,CONVERT(VARCHAR(10), CR14_fechaCom, 23) AS fechaEmision, CR04_nomComprador , hora_carga , PI02_imporComprobante,     PI34_baseImpLocal, PI05_imporIva, iv.poriva,  MOTIVOANULACION, FECHAANULACION, HORAANULACION      FROM cabecera,pie,iv WHERE pie.nom_archivo = cabecera.nom_archivo and iv.nom_archivo = cabecera.nom_archivo     UNION ALL     SELECT  cabecera_AUT.control, CONVERT(VARCHAR(255), nro_documento) AS nro_documento, CR15_tipoCom, CR05_rifCirion AS CR03_numIden, CR03_fechaEmision AS fechaEmision, CR04_nomProveedor AS CR04_nomComprador, hora_proceso AS hora_carga, PI04_totalPagarBs AS PI02_imporComprobante,     PI02_baseImponbleBs AS PI34_baseImpLocal,PI03_IVABs as PI05_imporIva, null as poriva,  MOTIVOANULACION, FECHAANULACION, HORAANULACION      FROM cabecera_AUT,PI_AUT WHERE PI_AUT.nom_archivo = cabecera_AUT.nom_archivo      UNION ALL     SELECT cabecera_GD.control, CONVERT(VARCHAR(255), nro_documento) AS nro_documento, CR15_tipoCom, CR10_rifEntrega AS CR03_numIden, CR02_fechaEmision AS fechaEmision, CR06_nombreEntrega AS CR04_nomComprador, hora_proceso AS hora_carga,     NULL AS PI02_imporComprobante, NULL AS PI34_baseImpLocal,null as  PI05_imporIva, null as poriva,  MOTIVOANULACION, FECHAANULACION, HORAANULACION     FROM cabecera_GD,PI_GD WHERE PI_GD.nom_archivo = cabecera_GD.nom_archivo ) AS encabezado


--clientes

INSERT INTO "dba"."clientes" ("id","rif","nombre_cliente","connections","logo","created_at","updated_at","enabled","name_bd_table","name_bd_column_numero_control","name_bd_column_fecha_emision","name_bd_column_fecha_emision_format","name_bd_column_fecha_asignacion","name_bd_column_fecha_asignacion_format","name_bd_column_numero_documento","name_bd_column_numero_documento_format","name_bd_table_coletilla","url_prod","url_qa","is_prod","name_bd_column_tipo_documento","name_bd_column_tipo_documento_format") VALUES(1,'J-30046239-0','CIRION TECHNOLOGIES, S.A.','PROD_ws_cirionIQ','/uploads/logo_clientes/8c975e2ae8a7da3908639e883ebd16f4.jpg','2023-12-10 15:06:56.911','2023-12-10 15:06:58.800',1,'(     SELECT  control, CONVERT(VARCHAR(255), nro_documento) AS nro_documento, CR15_tipoCom, CR03_numIden,CONVERT(date, CR14_fechaCom, 112) AS fechaEmision, CR04_nomComprador , hora_carga , PI02_imporComprobante,     PI34_baseImpLocal, PI05_imporIva, iv.poriva,  MOTIVOANULACION, FECHAANULACION, HORAANULACION      FROM cabecera,pie,iv WHERE pie.nom_archivo = cabecera.nom_archivo and iv.nom_archivo = cabecera.nom_archivo     UNION ALL     SELECT  cabecera_AUT.control, CONVERT(VARCHAR(255), nro_documento) AS nro_documento, CR15_tipoCom, CR05_rifCirion AS CR03_numIden, CR03_fechaEmision AS fechaEmision, CR04_nomProveedor AS CR04_nomComprador, hora_proceso AS hora_carga, PI04_totalPagarBs AS PI02_imporComprobante,     PI02_baseImponbleBs AS PI34_baseImpLocal,PI03_IVABs as PI05_imporIva, null as poriva,  MOTIVOANULACION, FECHAANULACION, HORAANULACION      FROM cabecera_AUT,PI_AUT WHERE PI_AUT.nom_archivo = cabecera_AUT.nom_archivo      UNION ALL     SELECT cabecera_GD.control, CONVERT(VARCHAR(255), nro_documento) AS nro_documento, CR15_tipoCom, CR10_rifEntrega AS CR03_numIden, CR02_fechaEmision AS fechaEmision, CR06_nombreEntrega AS CR04_nomComprador, hora_proceso AS hora_carga,     NULL AS PI02_imporComprobante, NULL AS PI34_baseImpLocal,null as  PI05_imporIva, null as poriva,  MOTIVOANULACION, FECHAANULACION, HORAANULACION     FROM cabecera_GD,PI_GD WHERE PI_GD.nom_archivo = cabecera_GD.nom_archivo ) AS encabezado','control','fechaEmision','YYYY-MM-DD','fechaEmision','YYYY-MM-DD','nro_documento',NULL,NULL,'https://wsdocdigital-cirion.solucioneslaser.com/CirionIQ-war/recursos/consulta/factura/{{encrypt}}',NULL,1,'CR15_tipoCom',NULL);
INSERT INTO "dba"."clientes" ("id","rif","nombre_cliente","connections","logo","created_at","updated_at","enabled","name_bd_table","name_bd_column_numero_control","name_bd_column_fecha_emision","name_bd_column_fecha_emision_format","name_bd_column_fecha_asignacion","name_bd_column_fecha_asignacion_format","name_bd_column_numero_documento","name_bd_column_numero_documento_format","name_bd_table_coletilla","url_prod","url_qa","is_prod","name_bd_column_tipo_documento","name_bd_column_tipo_documento_format") VALUES(2,'J-09006646-2','CORPORACION DROLANCA C.A.','PROD_ws_drolanca032','/uploads/logo_clientes/dbff700f43db54d16cc7a6095dfffd0f.jpg','2023-12-10 15:06:56.911','2023-12-10 15:06:58.800',1,'cabecera','numero_control_numerico','ERDAT','YYYY-MM-DD','FECHACARGA','YYYY-MM-DD','BELNR',NULL,NULL,'https://wsdocdigital-drolanca.solucioneslaser.com/Drolanca-war/recursos/consulta/factura/{{encrypt}}',NULL,1,'L_LETRA','NDF;NCF;FME;FPS;FPU;NCL;FAC;FFL');
INSERT INTO "dba"."clientes" ("id","rif","nombre_cliente","connections","logo","created_at","updated_at","enabled","name_bd_table","name_bd_column_numero_control","name_bd_column_fecha_emision","name_bd_column_fecha_emision_format","name_bd_column_fecha_asignacion","name_bd_column_fecha_asignacion_format","name_bd_column_numero_documento","name_bd_column_numero_documento_format","name_bd_table_coletilla","url_prod","url_qa","is_prod","name_bd_column_tipo_documento","name_bd_column_tipo_documento_format") VALUES(3,'J-00362916-2','SOLUCIONES LASER C.A','PROD_solucioneslaser','/uploads/logo_clientes/1245a4c6153f927aae66d31000c52695.jpg','2023-12-10 15:06:56.911','2023-12-10 15:06:58.800',1,'encabezado','numero_control_numerico','CA_fecha_emision','YYYY-MM-DD','CA_fecha_asigControl','YYYY-MM-DD','CA_nro_factura','0000044931',NULL,'https://wsdocdigital-laser.solucioneslaser.com/solucionesLaser-war/recursos/documento/pdf/{{encrypt}}',NULL,1,'CA_tipo_documento','FA;NC');
INSERT INTO "dba"."clientes" ("id","rif","nombre_cliente","connections","logo","created_at","updated_at","enabled","name_bd_table","name_bd_column_numero_control","name_bd_column_fecha_emision","name_bd_column_fecha_emision_format","name_bd_column_fecha_asignacion","name_bd_column_fecha_asignacion_format","name_bd_column_numero_documento","name_bd_column_numero_documento_format","name_bd_table_coletilla","url_prod","url_qa","is_prod","name_bd_column_tipo_documento","name_bd_column_tipo_documento_format") VALUES(4,'J-30018017-4','SODEXHO PASS VENEZUELA, C.A.','PROD_ws_sodexo','/uploads/logo_clientes/e12b5fbb403af86a29dd13f36cd3ca4e.jpg','2023-12-10 15:06:56.911','2023-12-10 15:06:58.800',1,'REG_1','control','fecha','YYYY-MM-DD','fecha','YYYY-MM-DD','numero1','023-000013;0023148673',NULL,'https://wsdocdigital-sodexo.solucioneslaser.com/Sodexo-war/recursos/consulta/factura/{{encrypt}}',NULL,1,'numero2','0000000001;0000000003');
INSERT INTO "dba"."clientes" ("id","rif","nombre_cliente","connections","logo","created_at","updated_at","enabled","name_bd_table","name_bd_column_numero_control","name_bd_column_fecha_emision","name_bd_column_fecha_emision_format","name_bd_column_fecha_asignacion","name_bd_column_fecha_asignacion_format","name_bd_column_numero_documento","name_bd_column_numero_documento_format","name_bd_table_coletilla","url_prod","url_qa","is_prod","name_bd_column_tipo_documento","name_bd_column_tipo_documento_format") VALUES(5,'J-30467796-0','HISPANA DE SEGUROS','PROD_HispanaSeguro','/uploads/logo_clientes/c75fae0ae69a9005c2bc2e38a918efb1.jpg','2023-12-10 15:06:56.911','2023-12-10 15:06:58.800',1,'encabezado','NRCONTROLSL','fechaemision_date','YYYY-MM-DD','fechaasignacion_date','YYYY-MM-DD','NFACTURA',NULL,NULL,'https://wsdocdigital-hispana.solucioneslaser.com/hispana-war/recursos/documento/factura/{{encrypt}}',NULL,1,'TIPODOC','FA');
INSERT INTO "dba"."clientes" ("id","rif","nombre_cliente","connections","logo","created_at","updated_at","enabled","name_bd_table","name_bd_column_numero_control","name_bd_column_fecha_emision","name_bd_column_fecha_emision_format","name_bd_column_fecha_asignacion","name_bd_column_fecha_asignacion_format","name_bd_column_numero_documento","name_bd_column_numero_documento_format","name_bd_table_coletilla","url_prod","url_qa","is_prod","name_bd_column_tipo_documento","name_bd_column_tipo_documento_format") VALUES(6,'J-30083118-3','BANESCO SEGUROS, C.A.','PROD_BanescoSeguros','/uploads/logo_clientes/89be7283e431d9b7aaf3e1789ed5e4ac.jpg','2023-12-10 15:06:56.911','2023-12-10 15:06:58.800',1,'factura','id_unico','FechaDocumento','YYYY-MM-DD','fecharetencioncomprobante','YYYY-MM-DD','NumeroDocumento',NULL,NULL,'https://wakalbanesco-seguros.solucioneslaser.com/Aplicacion/Busquedas/visualizar.php?num={{encrypt}}',NULL,1,'TipoDocumento','1;3');
INSERT INTO "dba"."clientes" ("id","rif","nombre_cliente","connections","logo","created_at","updated_at","enabled","name_bd_table","name_bd_column_numero_control","name_bd_column_fecha_emision","name_bd_column_fecha_emision_format","name_bd_column_fecha_asignacion","name_bd_column_fecha_asignacion_format","name_bd_column_numero_documento","name_bd_column_numero_documento_format","name_bd_table_coletilla","url_prod","url_qa","is_prod","name_bd_column_tipo_documento","name_bd_column_tipo_documento_format") VALUES(7,'J-08518977-7','DROGUERIA NENA C.A.','PROD_dronena','/uploads/logo_clientes/691cadcbc3ceafb3418e86de876822c6.jpg','2023-12-10 15:06:56.911','2023-12-10 15:06:58.800',1,'Encabezado','NUMCONTROL','FECHADOC','YYYY-MM-DD','FECHACONTROL','YYYY-MM-DD','NUMERODOC',NULL,NULL,'https://getdocdigital-dronena.solucioneslaser.com/dronena-war/recursos/documento/ver/{{encrypt}}',NULL,1,'TIPODOC','FA;NC;ND;NE');
INSERT INTO "dba"."clientes" ("id","rif","nombre_cliente","connections","logo","created_at","updated_at","enabled","name_bd_table","name_bd_column_numero_control","name_bd_column_fecha_emision","name_bd_column_fecha_emision_format","name_bd_column_fecha_asignacion","name_bd_column_fecha_asignacion_format","name_bd_column_numero_documento","name_bd_column_numero_documento_format","name_bd_table_coletilla","url_prod","url_qa","is_prod","name_bd_column_tipo_documento","name_bd_column_tipo_documento_format") VALUES(8,'J-31650803-0','SOLUCIONES DE LOCALIZACION TRACKER,  C.A.','PROD_tracker','/uploads/logo_clientes/882014e7776fd0c8a669338bba79f877.jpg','2023-12-10 15:06:56.911','2023-12-10 15:06:58.800',1,'factura','id_unico','FechaDocumento','YYYY-MM-DD','FechaDocumento','YYYY-MM-DD','NumeroDocumento',NULL,NULL,'https://portaldocdigital-tracker.solucioneslaser.com/Aplicacion/Busquedas/visualizar.php?num={{encrypt}}',NULL,1,'TipoDocumento','1;2;3');
INSERT INTO "dba"."clientes" ("id","rif","nombre_cliente","connections","logo","created_at","updated_at","enabled","name_bd_table","name_bd_column_numero_control","name_bd_column_fecha_emision","name_bd_column_fecha_emision_format","name_bd_column_fecha_asignacion","name_bd_column_fecha_asignacion_format","name_bd_column_numero_documento","name_bd_column_numero_documento_format","name_bd_table_coletilla","url_prod","url_qa","is_prod","name_bd_column_tipo_documento","name_bd_column_tipo_documento_format") VALUES(9,'J-00102174-4','ZOOM INTERNATIONAL SERVICES, C.A','PROD_WakalZoom','/uploads/logo_clientes/26bd197d4af3abd584ff2afa93e0a882.jpg','2023-12-10 15:06:56.911','2023-12-10 15:06:58.800',1,'encabezado','numcontrol','fecha_emision','YYYY-MM-DD','fecha_control','YYYY-MM-DD','nrodocumento','F-0000000001;NC-000000003;ND-000000001',NULL,'https://zoomws.solucioneslaser.com/SWakalZoom-war/recursos/documento/ver/{{encrypt}}',NULL,1,'tipodoccumento','FA;NC;ND');
INSERT INTO "dba"."clientes" ("id","rif","nombre_cliente","connections","logo","created_at","updated_at","enabled","name_bd_table","name_bd_column_numero_control","name_bd_column_fecha_emision","name_bd_column_fecha_emision_format","name_bd_column_fecha_asignacion","name_bd_column_fecha_asignacion_format","name_bd_column_numero_documento","name_bd_column_numero_documento_format","name_bd_table_coletilla","url_prod","url_qa","is_prod","name_bd_column_tipo_documento","name_bd_column_tipo_documento_format") VALUES(10,'J-00091991-7','DOCUMENTOS MERCANTILES, S.A. DOMESA','PROD_Domesa','/uploads/logo_clientes/fcf7eddf7f6ed4f7437c6c9818d3b80f.jpg','2023-12-10 15:06:56.911','2023-12-10 15:06:58.800',1,'ReporteDatos','TIPODOCUMENTO','convert(date,FECHAEMISION,105)','DD-MM-YYYY','convert(date,FECHAEMISION,105)','DD-MM-YYYY','NUMEROCONTROL',NULL,NULL,'https://wsdomesa.solucioneslaser.com/domesaService-war/recursos/documento/pdf/{{encrypt}}',NULL,1,NULL,NULL);
INSERT INTO "dba"."clientes" ("id","rif","nombre_cliente","connections","logo","created_at","updated_at","enabled","name_bd_table","name_bd_column_numero_control","name_bd_column_fecha_emision","name_bd_column_fecha_emision_format","name_bd_column_fecha_asignacion","name_bd_column_fecha_asignacion_format","name_bd_column_numero_documento","name_bd_column_numero_documento_format","name_bd_table_coletilla","url_prod","url_qa","is_prod","name_bd_column_tipo_documento","name_bd_column_tipo_documento_format") VALUES(11,'G-20000199-2','INSTITUTO MUNICIPAL DEL AMBIENTE','PROD_wsima','/uploads/logo_clientes/16c608c841cf4ac8e4f8a6e7f10a5672.jpg','2023-12-10 15:06:56.911','2023-12-10 15:06:58.800',1,'Encabezado','nrocontrol','convert(date,fecha,104)','DD-MM-YYYY','convert(date,fechanrocontrol,104)','DD-MM-YYYY','nrodocumento',NULL,NULL,'https://wsima.solucioneslaser.com/wsima-war/recursos/documento/ver/{{encrypt}}',NULL,1,'tipodocumento','FA;ND;NC');
INSERT INTO "dba"."clientes" ("id","rif","nombre_cliente","connections","logo","created_at","updated_at","enabled","name_bd_table","name_bd_column_numero_control","name_bd_column_fecha_emision","name_bd_column_fecha_emision_format","name_bd_column_fecha_asignacion","name_bd_column_fecha_asignacion_format","name_bd_column_numero_documento","name_bd_column_numero_documento_format","name_bd_table_coletilla","url_prod","url_qa","is_prod","name_bd_column_tipo_documento","name_bd_column_tipo_documento_format") VALUES(12,'J-31286704-3','TODOTICKET  2004 C.A','PROD_todoticket','/uploads/logo_clientes/94673de3835f63b7f7517f4497872191.jpg','2023-12-10 15:06:56.911','2023-12-10 15:06:58.800',1,'encabezado','controln','fechaemisiondate','YYYY-MM-DD','fechaemisiondate','YYYY-MM-DD','num_fact',NULL,NULL,'https://wstodoticket.solucioneslaser.com/todoticketservicio-war/recursos/documento/pdf/{{encrypt}}',NULL,1,'tipo','F1;F2;NC');
INSERT INTO "dba"."clientes" ("id","rif","nombre_cliente","connections","logo","created_at","updated_at","enabled","name_bd_table","name_bd_column_numero_control","name_bd_column_fecha_emision","name_bd_column_fecha_emision_format","name_bd_column_fecha_asignacion","name_bd_column_fecha_asignacion_format","name_bd_column_numero_documento","name_bd_column_numero_documento_format","name_bd_table_coletilla","url_prod","url_qa","is_prod","name_bd_column_tipo_documento","name_bd_column_tipo_documento_format") VALUES(13,'J-30259700-5','GALAXY ENTERTAINMENT DE VENEZUELA, S.C.A.','PROD_simpletv032','/uploads/logo_clientes/e3f3b6ce8b75dafc2ff5a13c47910932.jpg','2023-12-10 15:06:56.911','2023-12-10 15:06:58.800',1,'{{Mes}}Encabezado','controln','fecha_emisiond','YYYY-MM-DD','fecha_asignacion','YYYY-MM-DD','numero_factura',NULL,'coletilla','https://wsdocdigital-simpletv.solucioneslaser.com/simpleTv032172023-war/recursos/documento/pdf/{{encrypt}}',NULL,1,'invodoctupe','1;2');
INSERT INTO "dba"."clientes" ("id","rif","nombre_cliente","connections","logo","created_at","updated_at","enabled","name_bd_table","name_bd_column_numero_control","name_bd_column_fecha_emision","name_bd_column_fecha_emision_format","name_bd_column_fecha_asignacion","name_bd_column_fecha_asignacion_format","name_bd_column_numero_documento","name_bd_column_numero_documento_format","name_bd_table_coletilla","url_prod","url_qa","is_prod","name_bd_column_tipo_documento","name_bd_column_tipo_documento_format") VALUES(14,'J-00220608-0','TRANSFERENCIAS Y ENCOMIENDAS ANGULO LOPEZ, C.A.','PROD_tealca032','/uploads/logo_clientes/2904169cca9f0e6536032a77213efcea.jpg','2024-03-27 16:20:28.124','2024-03-27 16:20:28.124',1,'encabezado','num_control','fecha_proceso','YYYY-MM-DD','fecha_proceso','YYYY-MM-DD','num_documento',NULL,NULL,'https://getdocdigital-tealca.solucioneslaser.com/Tealca/recursos/documento/ver/{{encrypt}}',NULL,1,'document_type','invoice;credit_note');
INSERT INTO "dba"."clientes" ("id","rif","nombre_cliente","connections","logo","created_at","updated_at","enabled","name_bd_table","name_bd_column_numero_control","name_bd_column_fecha_emision","name_bd_column_fecha_emision_format","name_bd_column_fecha_asignacion","name_bd_column_fecha_asignacion_format","name_bd_column_numero_documento","name_bd_column_numero_documento_format","name_bd_table_coletilla","url_prod","url_qa","is_prod","name_bd_column_tipo_documento","name_bd_column_tipo_documento_format") VALUES(15,'J-30818251-6','CORPORACION FIBEX TELECOM, C.A.','PROD_fibex','/uploads/logo_clientes/27b8c957dd138fa1ca2fbdf46bcc8530.jpg','2024-03-27 16:21:55.066','2024-03-27 16:21:55.066',1,'encabezado','nrocontrol','convert(date,fechaemision,103)','DD/MM/YYYY','convert(date,fechacontrol,103)','DD/MM/YYYY','nrodocumento',NULL,NULL,'https://wsdocdigital-fibex.solucioneslaser.com/fibex-war/recursos/documento/ver/{{encrypt}}',NULL,1,'tipodocumento','FA;NC');
INSERT INTO "dba"."clientes" ("id","rif","nombre_cliente","connections","logo","created_at","updated_at","enabled","name_bd_table","name_bd_column_numero_control","name_bd_column_fecha_emision","name_bd_column_fecha_emision_format","name_bd_column_fecha_asignacion","name_bd_column_fecha_asignacion_format","name_bd_column_numero_documento","name_bd_column_numero_documento_format","name_bd_table_coletilla","url_prod","url_qa","is_prod","name_bd_column_tipo_documento","name_bd_column_tipo_documento_format") VALUES(16,'J-30819225-2','RUTAS AEREAS DE VENEZUELA RAV, S.A. (RAVSA)','PROD_venezolana-service','/uploads/logo_clientes/55081230568391f44c7e1cbdecd521c1.jpg','2024-03-27 13:05:58.695','2024-03-27 13:05:58.695',1,'encabezado','nroControl','FechaEmision','YYYY-MM-DD','fechaEmision','YYYY-MM-DD','nroDocumento','000000028015',NULL,'https://wsdocdigital-lavzlana.solucioneslaser.com/Venezolana-war/recursos/doc/generar/{{encrypt}}',NULL,1,'tipoDoc','FA;NC')





{"placeholder":["Factura","Nota de Debito","Nota de Crédito"],"values":[["FA"],["ND"],["NC"]]}

//dronena
{"placeholder":["Factura","Nota de Debito","Nota de Crédito","Nota de Entrega"],"values":[["FA"],["ND"],["NC"],["NE"]]}


//TT
{"placeholder": ["Factura","Nota de Debito","Nota de Crédito"],"values": [["F1","F2"], ["ND"], ["NC"]]}

//tealca
{"placeholder":["Factura","Nota de Debito","Nota de Crédito"],"values":[["invoice"],["debit_note"],["credit_note"]]}

//banesco seguros y tracker y cirion
{"placeholder":["Factura","Nota de Debito","Nota de Crédito"],"values":[["1"],["2"],["3"]]}

//simpletv y sodexo
{"placeholder":["Factura","Nota de Debito","Nota de Crédito"],"values":[["1"],["3"],["2"]]}

//drolanca
{"placeholder":["Factura","Nota de Debito","Nota de Crédito"],"values":[["FME","FPS","FPU","FAC","FFL"],["NDF"],["NCF", "NCL"]]}