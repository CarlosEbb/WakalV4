DROP TABLE consultas_roles;
DROP TABLE consultas_parametros;
DROP TABLE parametros;
DROP TABLE consultas;
DROP TABLE clientes;
DROP TABLE blacklisted_tokens;
DROP TABLE blacklisted_password;
DROP TABLE auditorias;
DROP TABLE usuarios_clientes;
DROP TABLE usuarios;
DROP TABLE roles;


CREATE TABLE roles (
	"id" INTEGER NOT NULL DEFAULT AUTOINCREMENT,
	"nombre" VARCHAR(150) NOT NULL,
	"descripcion" VARCHAR(150) NOT NULL,
	"created_at" "datetime" NULL DEFAULT CURRENT TIMESTAMP,
	"updated_at" "datetime" NULL DEFAULT CURRENT TIMESTAMP,
	PRIMARY KEY ( "id" ASC )
) IN "system";

INSERT INTO roles ("id","nombre","descripcion","created_at","updated_at") VALUES(1,'Administrador','','2024-03-19 12:38:33.523','2024-03-19 12:38:33.523');
INSERT INTO roles ("id","nombre","descripcion","created_at","updated_at") VALUES(2,'SENIAT','','2024-03-19 12:41:55.765','2024-03-19 12:41:55.765');
INSERT INTO roles ("id","nombre","descripcion","created_at","updated_at") VALUES(3,'Cliente','','2024-03-19 12:42:09.424','2024-03-19 12:42:09.424');
INSERT INTO roles ("id","nombre","descripcion","created_at","updated_at") VALUES(4,'Atencion al Cliente','','2024-03-19 12:42:18.267','2024-03-19 12:42:18.267');

CREATE TABLE usuarios (
	"id" INTEGER NOT NULL DEFAULT AUTOINCREMENT,
	"email" VARCHAR(150) NOT NULL,
	"password" VARCHAR(255) NOT NULL,
	"rol_id" INTEGER NOT NULL,
	"nombre" VARCHAR(150) NOT NULL,
	"apellido" VARCHAR(150) NOT NULL,
	"prefijo_cedula" VARCHAR(5) NOT NULL,
	"cedula" VARCHAR(10) NOT NULL,
	"access_expiration" DATE NULL,
	"created_at" "datetime" NULL DEFAULT CURRENT TIMESTAMP,
	"updated_at" "datetime" NULL DEFAULT CURRENT TIMESTAMP,
	"registered_by_user_id" INTEGER NULL,
	"enabled" BIT NOT NULL DEFAULT 1,
	"email_alternativo" VARCHAR(150) NOT NULL,
	"ultima_conexion" "datetime" NOT NULL DEFAULT current date,
	"img_profile" VARCHAR(500) NULL,
	"department" VARCHAR(100) NULL,
	"username" VARCHAR(100) NOT NULL UNIQUE,
	"telefono" VARCHAR(11) NULL,
	"jurisdiccion_estado" VARCHAR(100) NULL,
	"jurisdiccion_region" VARCHAR(100) NULL,
	"jurisdiccion_sector" VARCHAR(100) NULL,
	"cargo" VARCHAR(100) NULL,
	"cod_area" CHAR(4) NULL,
	"is_tour" BIT NULL DEFAULT 0,
	"failed_attempts" INTEGER NOT NULL DEFAULT 0,
	PRIMARY KEY ( "id" ASC )
) IN "system";



INSERT INTO usuarios ("id","email","password","rol_id","nombre","apellido","prefijo_cedula","cedula","access_expiration","created_at","updated_at","registered_by_user_id","enabled","email_alternativo","ultima_conexion","img_profile","department","username","telefono","jurisdiccion_estado","jurisdiccion_region","jurisdiccion_sector","cargo","cod_area","is_tour","failed_attempts") VALUES(1,'carlos_ebb@outlook.com','$2b$10$V1ZkAcA0fvhL.ealIuIep.ePFGAalf41DVeTd/gGwd06hdu3JdSV.',1,'Carlos','Bolivar','V','24886638','2024-09-29','2024-03-19 12:27:49.075','2024-03-19 12:27:49.075',NULL,1,'carlos_ebb@outlook.com','2024-07-04 11:15:00.687','/uploads/img_perfil/57422a21cde0fcefd1f95397be3be1fb.jpg','Soluciones Laser Desarrollo','carlosebb','3054914','Estado1','region1','sector1','Desarrollador','0414',0,0);
INSERT INTO usuarios ("id","email","password","rol_id","nombre","apellido","prefijo_cedula","cedula","access_expiration","created_at","updated_at","registered_by_user_id","enabled","email_alternativo","ultima_conexion","img_profile","department","username","telefono","jurisdiccion_estado","jurisdiccion_region","jurisdiccion_sector","cargo","cod_area","is_tour","failed_attempts") VALUES(24,'josio@solucioneslaser.com','$2b$10$bEaUIkLdP2YlVruow6E3eOYcYxdIiHL7dG6qo496FnwZWGDuWpMSO',1,'Juan','Osio','V','12345678','2024-12-11','2024-03-21 13:07:47.952','2024-03-21 13:07:47.952',1,1,'ejemplo@ggmail.com','2024-07-03 17:26:08.645','/uploads/img_perfil/844efba0301e9eb45feb189f770f3162.jpg','Soluciones Laser Soporte','josio','1234567','Estado2','region3','sector5','Carlos','0424',0,0);
INSERT INTO usuarios ("id","email","password","rol_id","nombre","apellido","prefijo_cedula","cedula","access_expiration","created_at","updated_at","registered_by_user_id","enabled","email_alternativo","ultima_conexion","img_profile","department","username","telefono","jurisdiccion_estado","jurisdiccion_region","jurisdiccion_sector","cargo","cod_area","is_tour","failed_attempts") VALUES(34,'cbolivar@solucioneslaser.com','$2b$10$D.9NBG.XZBv2fzOiJETCi.YL20OXiudBNdOhCGbEeC.NHfVuSmkAW',2,'Pedro','Perez','V','12345678','2024-12-11','2024-03-21 13:07:47.952','2024-03-21 13:07:47.952',24,0,'otro@hgmail.com','2024-04-18 15:47:47.553',NULL,'Soluciones Laser Soporte','slcarlos',NULL,NULL,NULL,NULL,NULL,NULL,0,0);
INSERT INTO usuarios ("id","email","password","rol_id","nombre","apellido","prefijo_cedula","cedula","access_expiration","created_at","updated_at","registered_by_user_id","enabled","email_alternativo","ultima_conexion","img_profile","department","username","telefono","jurisdiccion_estado","jurisdiccion_region","jurisdiccion_sector","cargo","cod_area","is_tour","failed_attempts") VALUES(35,'cirion@cirion.com','$2b$10$D.9NBG.XZBv2fzOiJETCi.YL20OXiudBNdOhCGbEeC.NHfVuSmkAW',3,'Cirion','Admin','V','12345678','2024-12-11','2024-03-21 13:07:47.952','2024-03-21 13:07:47.952',NULL,1,'cirion@hgmail.com','2024-07-04 09:27:42.360',NULL,'Cirion','cirion',NULL,NULL,NULL,NULL,NULL,NULL,0,0);
INSERT INTO usuarios ("id","email","password","rol_id","nombre","apellido","prefijo_cedula","cedula","access_expiration","created_at","updated_at","registered_by_user_id","enabled","email_alternativo","ultima_conexion","img_profile","department","username","telefono","jurisdiccion_estado","jurisdiccion_region","jurisdiccion_sector","cargo","cod_area","is_tour","failed_attempts") VALUES(103,'geno@ejemplo.com','$2b$10$nGYHAs14mmdNMVjggJ9lMOip07JZpH.8/xSDX9Ryd.jrPkA9hM/kW',3,'Genobellys','Romero','V','16590141',NULL,'2024-04-26 17:19:20.777','2024-04-26 17:19:20.777',NULL,1,'geno@ejemplo.com','2024-04-26 17:42:30.636',NULL,'Desarrollo Agil','solucioneslaser','1234567',NULL,NULL,NULL,'Lider','0424',0,0);
INSERT INTO usuarios ("id","email","password","rol_id","nombre","apellido","prefijo_cedula","cedula","access_expiration","created_at","updated_at","registered_by_user_id","enabled","email_alternativo","ultima_conexion","img_profile","department","username","telefono","jurisdiccion_estado","jurisdiccion_region","jurisdiccion_sector","cargo","cod_area","is_tour","failed_attempts") VALUES(104,'ejemplo@gmail.com','$2b$10$of8ZM1xI.6iceHaA7p24c.QOpEC1QlsFozjAjz.9SdvCze4ICdUva',3,'Ejemplo','Ejemplo','V','16590141',NULL,'2024-05-06 13:52:25.373','2024-05-06 13:52:25.373',35,1,'ejemplo@solucioneslaser.com','2024-05-06 13:52:58.529',NULL,'SL','yumaira','1234567',NULL,NULL,NULL,'SL','0424',0,0);
INSERT INTO usuarios ("id","email","password","rol_id","nombre","apellido","prefijo_cedula","cedula","access_expiration","created_at","updated_at","registered_by_user_id","enabled","email_alternativo","ultima_conexion","img_profile","department","username","telefono","jurisdiccion_estado","jurisdiccion_region","jurisdiccion_sector","cargo","cod_area","is_tour","failed_attempts") VALUES(105,'cebolivarbarrios@gmail.com','$2b$10$pIOX06hlIv4QxmJ4uXc1pu9ZdCd7xGqaMv8VrW2L/Mi7Wp86AnHSq',2,'Carlos','Bolivar','V','24886638',NULL,'2024-06-07 12:39:23.039','2024-06-07 12:39:23.039',NULL,1,'cebolivarbarrios@gmail.com','2024-06-10 14:37:36.274',NULL,'SENIAT','carlosebbs','3054914','Miranda','Región Capital','Altos Mirandinos','ejemplo','0414',0,0);
INSERT INTO usuarios ("id","email","password","rol_id","nombre","apellido","prefijo_cedula","cedula","access_expiration","created_at","updated_at","registered_by_user_id","enabled","email_alternativo","ultima_conexion","img_profile","department","username","telefono","jurisdiccion_estado","jurisdiccion_region","jurisdiccion_sector","cargo","cod_area","is_tour","failed_attempts") VALUES(109,'lsilva@solucioneslaser.com','$2b$10$H1uUfmGCvULihvx.KzbseOmRqRff.5x0IXtmLwmnIOu8IWXXx5qp.',3,'Luis','Silva','V','1234567','2024-10-02','2024-07-04 10:10:45.680','2024-07-04 10:10:45.680',NULL,1,'lsilva@solucioneslaser.com','2024-07-04 11:16:00.810',NULL,'SL','bootv','1234567',NULL,NULL,NULL,'SuperCliente','0424',0,0);

CREATE TABLE usuarios_clientes (
	"id" INTEGER NOT NULL DEFAULT AUTOINCREMENT,
	"user_id" INTEGER NOT NULL,
	"cliente_id" INTEGER NOT NULL,
	"created_at" "datetime" NULL DEFAULT CURRENT TIMESTAMP,
	"updated_at" "datetime" NULL DEFAULT CURRENT TIMESTAMP,
	PRIMARY KEY ( "id" ASC )
) IN "system";

INSERT INTO usuarios_clientes ("id","user_id","cliente_id","created_at","updated_at") VALUES(0,35,1,'2024-04-18 16:23:28.792','2024-04-18 16:23:28.792');
INSERT INTO usuarios_clientes ("id","user_id","cliente_id","created_at","updated_at") VALUES(7,103,3,'2024-04-26 17:19:20.785','2024-04-26 17:19:20.785');
INSERT INTO usuarios_clientes ("id","user_id","cliente_id","created_at","updated_at") VALUES(8,104,1,'2024-05-06 13:52:25.397','2024-05-06 13:52:25.397');
INSERT INTO usuarios_clientes ("id","user_id","cliente_id","created_at","updated_at") VALUES(9,109,13,'2024-07-04 10:10:45.695','2024-07-04 10:10:45.695');

CREATE TABLE auditorias (
	"id" BIGINT NOT NULL DEFAULT AUTOINCREMENT UNIQUE,
	"usuario_id" INTEGER NOT NULL,
	"rol_id" INTEGER NOT NULL,
	"ruta" VARCHAR(255) NULL,
	"method" VARCHAR(10) NULL,
	"body" VARCHAR(2500) NULL,
	"ip_cliente" VARCHAR(50) NULL,
	"created_at" "datetime" NOT NULL DEFAULT CURRENT TIMESTAMP,
	"update_at" "datetime" NOT NULL DEFAULT CURRENT TIMESTAMP,
	PRIMARY KEY ( "id" ASC )
) IN "system";

CREATE TABLE blacklisted_password (
	"id" INTEGER NOT NULL DEFAULT AUTOINCREMENT,
	"user_id" INTEGER NOT NULL,
	"password" VARCHAR(255) NOT NULL UNIQUE,
	"created_at" "datetime" NULL DEFAULT CURRENT TIMESTAMP,
	"updated_at" "datetime" NULL DEFAULT CURRENT TIMESTAMP,
	PRIMARY KEY ( "id" ASC )
) IN "system";

CREATE TABLE blacklisted_tokens (
	"id" INTEGER NOT NULL DEFAULT AUTOINCREMENT,
	"user_id" INTEGER NOT NULL,
	"token" VARCHAR(255) NOT NULL UNIQUE,
	"reason" VARCHAR(255) NULL,
	"created_at" "datetime" NULL DEFAULT CURRENT TIMESTAMP,
	"updated_at" "datetime" NULL DEFAULT CURRENT TIMESTAMP,
	PRIMARY KEY ( "id" ASC )
) IN "system";


CREATE TABLE clientes (
	"id" INTEGER NOT NULL DEFAULT AUTOINCREMENT UNIQUE,
	"rif" VARCHAR(20) NOT NULL UNIQUE,
	"nombre_cliente" VARCHAR(50) NOT NULL,
	"connections" VARCHAR(255) NULL,
	"logo" VARCHAR(255) NULL,
	"created_at" "datetime" NULL DEFAULT CURRENT TIMESTAMP,
	"updated_at" "datetime" NULL DEFAULT CURRENT TIMESTAMP,
	"enabled" BIT NULL DEFAULT 1,
	"name_bd_table" VARCHAR(7000) NULL,
	"name_bd_column_numero_control" VARCHAR(100) NULL,
	"name_bd_column_fecha_emision" VARCHAR(100) NULL,
	"name_bd_column_fecha_emision_format" VARCHAR(100) NULL,
	"name_bd_column_fecha_asignacion" VARCHAR(100) NULL,
	"name_bd_column_fecha_asignacion_format" VARCHAR(100) NULL,
	"name_bd_column_numero_documento" VARCHAR(100) NULL,
	"name_bd_column_numero_documento_format" VARCHAR(100) NULL,
	"name_bd_table_coletilla" VARCHAR(255) NULL,
	"url_prod" VARCHAR(255) NULL,
	"url_qa" VARCHAR(255) NULL,
	"is_prod" BIT NOT NULL DEFAULT 0,
	"name_bd_column_tipo_documento" VARCHAR(255) NULL,
	"name_bd_column_tipo_documento_format" VARCHAR(1000) NULL,
	"name_bd_column_tipo_documento_view_pdf_format" VARCHAR(255) NULL,
	"numero_control_view_pdf_format" BIT NOT NULL DEFAULT 0,
	"encrypt_url_format" VARCHAR(255) NULL,
	"encrypt_url_format_order" VARCHAR(255) NULL,
	"name_bd_column_encrypt" VARCHAR(255) NULL,
	"name_bd_column_encrypt_others" VARCHAR(255) NULL,
	"name_bd_column_rif" VARCHAR(255) NULL,
	"name_bd_column_razon_social" VARCHAR(255) NULL,
	"name_bd_column_codigo_operacion" VARCHAR(255) NULL,
	"name_bd_column_serie" VARCHAR(255) NULL,
	"name_bd_column_hora_emision" VARCHAR(255) NULL,
	"name_bd_column_status" VARCHAR(255) NULL,
	"name_bd_column_motivo_anulacion" VARCHAR(255) NULL,
	"name_bd_column_fecha_anulacion" VARCHAR(255) NULL,
	"name_bd_column_hora_anulacion" VARCHAR(255) NULL,
	"name_bd_column_neto_pagar" VARCHAR(255) NULL,
	"name_bd_column_igtf" VARCHAR(255) NULL,
	"name_bd_column_total_pagar" VARCHAR(255) NULL,
	"name_bd_column_base_imponible" VARCHAR(25) NULL,
	"name_bd_column_monto_iva" VARCHAR(255) NULL,
	"name_bd_column_monto_exento" VARCHAR(255) NULL,
	"name_bd_column_monto_no_sujeto" VARCHAR(255) NULL,
	"name_bd_column_serie_format" VARCHAR(1000) NULL,
	"name_bd_column_codigo_operacion_format" VARCHAR(255) NULL,
	"name_bd_column_correo_cliente" VARCHAR(255) NULL,
	"name_bd_column_telefono_cliente" VARCHAR(255) NULL,
	"url_prod_anexos" VARCHAR(255) NULL,
	"url_qa_anexos" VARCHAR(255) NULL,
	"name_bd_column_anexos" VARCHAR(255) NULL,
	"name_bd_column_codigo_suscriptor" VARCHAR(255) NULL,
	"name_bd_column_tipo_war" VARCHAR(255) NULL,
	"connections_string" VARCHAR(500) NULL,
	PRIMARY KEY ( "id" ASC )
) IN "system";



INSERT INTO "dba"."clientes" ("id","rif","nombre_cliente","connections","logo","created_at","updated_at","enabled","name_bd_table","name_bd_column_numero_control","name_bd_column_fecha_emision","name_bd_column_fecha_emision_format","name_bd_column_fecha_asignacion","name_bd_column_fecha_asignacion_format","name_bd_column_numero_documento","name_bd_column_numero_documento_format","name_bd_table_coletilla","url_prod","url_qa","is_prod","name_bd_column_tipo_documento","name_bd_column_tipo_documento_format","name_bd_column_tipo_documento_view_pdf_format","numero_control_view_pdf_format","encrypt_url_format","encrypt_url_format_order","name_bd_column_encrypt","name_bd_column_encrypt_others","name_bd_column_rif","name_bd_column_razon_social","name_bd_column_codigo_operacion","name_bd_column_serie","name_bd_column_hora_emision","name_bd_column_status","name_bd_column_motivo_anulacion","name_bd_column_fecha_anulacion","name_bd_column_hora_anulacion","name_bd_column_neto_pagar","name_bd_column_igtf","name_bd_column_total_pagar","name_bd_column_base_imponible","name_bd_column_monto_iva","name_bd_column_monto_exento","name_bd_column_monto_no_sujeto","name_bd_column_serie_format","name_bd_column_codigo_operacion_format","name_bd_column_correo_cliente","name_bd_column_telefono_cliente","url_prod_anexos","url_qa_anexos","name_bd_column_anexos","name_bd_column_codigo_suscriptor","name_bd_column_tipo_war","connections_string") VALUES(1,'J-30046239-0','CIRION TECHNOLOGIES, S.A.','Driver=Sybase IQ;Server=ws_cirionIQ;CommLinks=tcpip(Host=10.130.0.2:4949);UID=dbawakal;PWD=elite','/uploads/logo_clientes/8c975e2ae8a7da3908639e883ebd16f4.jpg','2023-11-01 15:06:56.000','2023-12-10 15:06:58.800',1,'(      SELECT c.control, CONVERT(VARCHAR(255), c.nro_documento) AS nro_documento, c.CR15_tipoCom, c.CR05_numCliente as codigo_suscriptor, c.CR03_numIden, CONVERT(date, c.CR14_fechaCom, 112) AS fechaEmision, c.CR04_nomComprador, c.hora_carga, p.PI02_imporComprobante, p.PI34_baseImpLocal, p.PI05_imporIva, iv.poriva, c.MOTIVOANULACION, c.FECHAANULACION, c.HORAANULACION, c.CR69_dirEmail as correo, c.CR75 as telefono, CASE WHEN a.nom_archivo IS NOT NULL THEN 1 ELSE NULL END AS anexos FROM cabecera c LEFT JOIN pie p ON c.nom_archivo = p.nom_archivo LEFT JOIN iv ON c.nom_archivo = iv.nom_archivo LEFT JOIN ( SELECT DISTINCT nom_archivo FROM anexos ) a ON c.nom_archivo = a.nom_archivo UNION ALL SELECT cabecera_AUT.control, CONVERT(VARCHAR(255), cabecera_AUT.nro_documento) AS nro_documento, cabecera_AUT.CR15_tipoCom, '''' as codigo_suscriptor, cabecera_AUT.CR05_rifCirion AS CR03_numIden, cabecera_AUT.CR03_fechaEmision AS fechaEmision, cabecera_AUT.CR04_nomProveedor AS CR04_nomComprador, cabecera_AUT.hora_proceso AS hora_carga, PI_AUT.PI04_totalPagarBs AS PI02_imporComprobante, PI_AUT.PI02_baseImponbleBs AS PI34_baseImpLocal, PI_AUT.PI03_IVABs AS PI05_imporIva, NULL AS poriva, cabecera_AUT.MOTIVOANULACION, cabecera_AUT.FECHAANULACION, cabecera_AUT.HORAANULACION, cabecera_AUT.CR08_emailCliente AS correo, '''' AS telefono, CASE WHEN a.nom_archivo IS NOT NULL THEN 1 ELSE NULL END AS anexos FROM cabecera_AUT LEFT JOIN PI_AUT ON PI_AUT.nom_archivo = cabecera_AUT.nom_archivo LEFT JOIN ( SELECT DISTINCT nom_archivo FROM anexos ) a ON cabecera_AUT.nom_archivo = a.nom_archivo UNION ALL SELECT cabecera_GD.control, CONVERT(VARCHAR(255), cabecera_GD.nro_documento) AS nro_documento, cabecera_GD.CR15_tipoCom, '''' as codigo_suscriptor, cabecera_GD.CR10_rifEntrega AS CR03_numIden, cabecera_GD.CR02_fechaEmision AS fechaEmision, cabecera_GD.CR06_nombreEntrega AS CR04_nomComprador, cabecera_GD.hora_proceso AS hora_carga, NULL AS PI02_imporComprobante, NULL AS PI34_baseImpLocal, NULL AS PI05_imporIva, NULL AS poriva, cabecera_GD.MOTIVOANULACION, cabecera_GD.FECHAANULACION, cabecera_GD.HORAANULACION, '''' AS correo, cabecera_GD.CR09_numTelefonoEntrega AS telefono, CASE WHEN a.nom_archivo IS NOT NULL THEN 1 ELSE NULL END AS anexos FROM cabecera_GD LEFT JOIN PI_GD ON PI_GD.nom_archivo = cabecera_GD.nom_archivo LEFT JOIN ( SELECT DISTINCT nom_archivo FROM anexos ) a ON cabecera_GD.nom_archivo = a.nom_archivo WHERE PI_GD.nom_archivo = cabecera_GD.nom_archivo ) AS encabezado','control','fechaEmision','YYYY-MM-DD','fechaEmision','YYYY-MM-DD','nro_documento',NULL,NULL,'https://wsdocdigital-cirion.solucioneslaser.com/CirionIQ-war/recursos/consulta/factura/{{encrypt}}',NULL,1,'CR15_tipoCom','{"placeholder":["Factura","Nota de Debito","Nota de Crédito", "Guia de Despacho"],"values":[["001","004"],["003"],["002"],["005"]]}','[["FACT","AUT"], ["ND"], ["NC"], ["GD"]]',1,'["codificar","base64"]','{{tipo_documento}}{{numero_control}}',NULL,NULL,'CR03_numIden','CR04_nomComprador',NULL,NULL,'hora_carga',NULL,'MOTIVOANULACION','FECHAANULACION','HORAANULACION','PI02_imporComprobante',NULL,'PI02_imporComprobante','PI34_baseImpLocal','PI05_imporIva',NULL,NULL,NULL,'6190','correo','telefono','https://wsdocdigital-cirion.solucioneslaser.com/CirionIQ-war/recursos/consulta/anexoFactura/{{encrypt}}',NULL,'anexos','codigo_suscriptor',NULL,'Driver=Sybase IQ;Server=ws_cirionIQ;CommLinks=tcpip(Host=10.130.0.2:4949);UID=dbawakal;PWD=elite');
INSERT INTO "dba"."clientes" ("id","rif","nombre_cliente","connections","logo","created_at","updated_at","enabled","name_bd_table","name_bd_column_numero_control","name_bd_column_fecha_emision","name_bd_column_fecha_emision_format","name_bd_column_fecha_asignacion","name_bd_column_fecha_asignacion_format","name_bd_column_numero_documento","name_bd_column_numero_documento_format","name_bd_table_coletilla","url_prod","url_qa","is_prod","name_bd_column_tipo_documento","name_bd_column_tipo_documento_format","name_bd_column_tipo_documento_view_pdf_format","numero_control_view_pdf_format","encrypt_url_format","encrypt_url_format_order","name_bd_column_encrypt","name_bd_column_encrypt_others","name_bd_column_rif","name_bd_column_razon_social","name_bd_column_codigo_operacion","name_bd_column_serie","name_bd_column_hora_emision","name_bd_column_status","name_bd_column_motivo_anulacion","name_bd_column_fecha_anulacion","name_bd_column_hora_anulacion","name_bd_column_neto_pagar","name_bd_column_igtf","name_bd_column_total_pagar","name_bd_column_base_imponible","name_bd_column_monto_iva","name_bd_column_monto_exento","name_bd_column_monto_no_sujeto","name_bd_column_serie_format","name_bd_column_codigo_operacion_format","name_bd_column_correo_cliente","name_bd_column_telefono_cliente","url_prod_anexos","url_qa_anexos","name_bd_column_anexos","name_bd_column_codigo_suscriptor","name_bd_column_tipo_war","connections_string") VALUES(2,'J-09006646-2','CORPORACION DROLANCA C.A.','PROD_ws_drolanca032','/uploads/logo_clientes/dbff700f43db54d16cc7a6095dfffd0f.jpg','2023-10-02 15:06:56.000','2023-12-10 15:06:58.800',1,'(SELECT * FROM cabecera LEFT JOIN pie ON cabecera.XBLNR = pie.XBLNR) as encabezado','numero_control_numerico','ERDAT','YYYY-MM-DD','FECHACARGA','YYYY-MM-DD','BELNR',NULL,NULL,'https://wsdocdigital-drolanca.solucioneslaser.com/Drolanca-war/recursos/consulta/factura/{{encrypt}}',NULL,1,'L_LETRA','{"placeholder":["Factura","Nota de Debito","Nota de Crédito"],"values":[["FME","FPS","FPU","FAC","FFL"],["NDF"],["NCF", "NCL"]]}',NULL,1,'["codificar","base64"]','{{tipo_documento}}{{numero_control}}',NULL,NULL,'B_RIF','B_NOMBRE',NULL,NULL,'HORACARGA','ANULADO','MOTIVOANULACION','FECHAANULACION','HORAANULACION','TOTAL_FACT',NULL,'TOTAL_FACT','BASE_IMP','TOTAL_IVA','EXENTO',NULL,NULL,'8690',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Driver=Sybase IQ;Server=ws_drolanca032;CommLinks=tcpip(Host=10.130.0.2:4747);UID=dbawakal;PWD=elite');
INSERT INTO "dba"."clientes" ("id","rif","nombre_cliente","connections","logo","created_at","updated_at","enabled","name_bd_table","name_bd_column_numero_control","name_bd_column_fecha_emision","name_bd_column_fecha_emision_format","name_bd_column_fecha_asignacion","name_bd_column_fecha_asignacion_format","name_bd_column_numero_documento","name_bd_column_numero_documento_format","name_bd_table_coletilla","url_prod","url_qa","is_prod","name_bd_column_tipo_documento","name_bd_column_tipo_documento_format","name_bd_column_tipo_documento_view_pdf_format","numero_control_view_pdf_format","encrypt_url_format","encrypt_url_format_order","name_bd_column_encrypt","name_bd_column_encrypt_others","name_bd_column_rif","name_bd_column_razon_social","name_bd_column_codigo_operacion","name_bd_column_serie","name_bd_column_hora_emision","name_bd_column_status","name_bd_column_motivo_anulacion","name_bd_column_fecha_anulacion","name_bd_column_hora_anulacion","name_bd_column_neto_pagar","name_bd_column_igtf","name_bd_column_total_pagar","name_bd_column_base_imponible","name_bd_column_monto_iva","name_bd_column_monto_exento","name_bd_column_monto_no_sujeto","name_bd_column_serie_format","name_bd_column_codigo_operacion_format","name_bd_column_correo_cliente","name_bd_column_telefono_cliente","url_prod_anexos","url_qa_anexos","name_bd_column_anexos","name_bd_column_codigo_suscriptor","name_bd_column_tipo_war","connections_string") VALUES(3,'J-00362916-2','SOLUCIONES LASER C.A','PROD_solucioneslaser','/uploads/logo_clientes/1245a4c6153f927aae66d31000c52695.jpg','2023-10-18 15:06:56.000','2023-12-10 15:06:58.800',1,'(     SELECT encabezado.*, resumen.RES_total_pagar_bs, resumen.RES_IGTF_bs, resumen.RES_subtotal_factura_bs, resumen.RES_base_imponible_bs, resumen.RES_montoIVA_bs, resumen.RES_total_exento_bs FROM encabezado LEFT JOIN resumen ON encabezado.con = resumen.con ) as encabezado','numero_control_numerico','CA_fecha_emision','YYYY-MM-DD','CA_fecha_asigControl','YYYY-MM-DD','CA_nro_factura','0000044931',NULL,'https://wsdocdigital-laser.solucioneslaser.com/solucionesLaser-war/recursos/documento/pdf/{{encrypt}}',NULL,1,'CA_tipo_documento','{"placeholder":["Factura","Nota de Debito","Nota de Crédito"],"values":[["FA"],["ND"],["NC"]]}',NULL,0,'["base64"]','{{tipo_documento}}{{numero_documento}}',NULL,NULL,'CA_rif','CA_razon_social','CA_cod_operacion',NULL,'CA_hora_emision','ANULADO','MOTIVOANULACION','FECHAANULACION','HORAANULACION','RES_total_pagar_bs','RES_IGTF_bs','RES_total_pagar_bs','RES_base_imponible_bs','RES_montoIVA_bs','RES_total_pagar_bs',NULL,NULL,NULL,'CA_email','CA_telefonos',NULL,NULL,NULL,NULL,NULL,'Driver=Sybase IQ;Server=solucioneslaser;CommLinks=tcpip(Host=10.130.0.2:4950);UID=dbawakal;PWD=elite');
INSERT INTO "dba"."clientes" ("id","rif","nombre_cliente","connections","logo","created_at","updated_at","enabled","name_bd_table","name_bd_column_numero_control","name_bd_column_fecha_emision","name_bd_column_fecha_emision_format","name_bd_column_fecha_asignacion","name_bd_column_fecha_asignacion_format","name_bd_column_numero_documento","name_bd_column_numero_documento_format","name_bd_table_coletilla","url_prod","url_qa","is_prod","name_bd_column_tipo_documento","name_bd_column_tipo_documento_format","name_bd_column_tipo_documento_view_pdf_format","numero_control_view_pdf_format","encrypt_url_format","encrypt_url_format_order","name_bd_column_encrypt","name_bd_column_encrypt_others","name_bd_column_rif","name_bd_column_razon_social","name_bd_column_codigo_operacion","name_bd_column_serie","name_bd_column_hora_emision","name_bd_column_status","name_bd_column_motivo_anulacion","name_bd_column_fecha_anulacion","name_bd_column_hora_anulacion","name_bd_column_neto_pagar","name_bd_column_igtf","name_bd_column_total_pagar","name_bd_column_base_imponible","name_bd_column_monto_iva","name_bd_column_monto_exento","name_bd_column_monto_no_sujeto","name_bd_column_serie_format","name_bd_column_codigo_operacion_format","name_bd_column_correo_cliente","name_bd_column_telefono_cliente","url_prod_anexos","url_qa_anexos","name_bd_column_anexos","name_bd_column_codigo_suscriptor","name_bd_column_tipo_war","connections_string") VALUES(4,'J-30018017-4','SODEXHO PASS VENEZUELA, C.A.','PROD_ws_sodexo','/uploads/logo_clientes/e12b5fbb403af86a29dd13f36cd3ca4e.jpg','2023-11-10 15:06:56.000','2023-12-10 15:06:58.800',1,'(     SELECT  REG_0.descripcion21 AS razonSocial,  REG_4.monto5 AS neto5,  REG_4.monto4 AS tpBS,  REG_4.monto1 AS base_im,  REG_4.monto3 AS iva,  REG_4.monto2 AS exento,  REG_3.monto4 AS IGTF4,  REG_3.descripcion11 AS netoAPAGAR,  REG_3.monto2 AS totalSU,  REG_2.monto3 AS basImpo, REG_1.* FROM  REG_4 JOIN  REG_1 ON REG_4.control = REG_1.control JOIN  REG_0 ON REG_0.control = REG_4.control JOIN  REG_3 ON REG_4.control = REG_3.control LEFT JOIN  REG_2 ON REG_4.control = REG_2.control ) AS encabezado','control','fecha','YYYY-MM-DD','fecha','YYYY-MM-DD','numero1','023-000013;0023148673',NULL,'https://wsdocdigital-sodexo.solucioneslaser.com/Sodexo-war/recursos/consulta/factura/{{encrypt}}',NULL,1,'numero2','{"placeholder":["Factura","Nota de Debito","Nota de Crédito"],"values":[["0000000001"],["0000000002"],["0000000003"]]}','[["FC"], ["ND"], ["NC"]]',1,'["base64"]','{{tipo_documento}}{{numero_control}}',NULL,NULL,'descripcion20','razonSocial','descripcion16',NULL,'descripcion16','ANULADO','MOTIVOANULACION','FECHAANULACION','HORAANULACION','netoAPAGAR','IGTF4','netoAPAGAR','basImpo','iva','exento',NULL,NULL,NULL,'descripcion21',NULL,NULL,NULL,NULL,NULL,NULL,'Driver=Sybase IQ;Server=ws_sodexo;CommLinks=tcpip(Host=10.130.0.5:2650);UID=dbawakal;PWD=elite');
INSERT INTO "dba"."clientes" ("id","rif","nombre_cliente","connections","logo","created_at","updated_at","enabled","name_bd_table","name_bd_column_numero_control","name_bd_column_fecha_emision","name_bd_column_fecha_emision_format","name_bd_column_fecha_asignacion","name_bd_column_fecha_asignacion_format","name_bd_column_numero_documento","name_bd_column_numero_documento_format","name_bd_table_coletilla","url_prod","url_qa","is_prod","name_bd_column_tipo_documento","name_bd_column_tipo_documento_format","name_bd_column_tipo_documento_view_pdf_format","numero_control_view_pdf_format","encrypt_url_format","encrypt_url_format_order","name_bd_column_encrypt","name_bd_column_encrypt_others","name_bd_column_rif","name_bd_column_razon_social","name_bd_column_codigo_operacion","name_bd_column_serie","name_bd_column_hora_emision","name_bd_column_status","name_bd_column_motivo_anulacion","name_bd_column_fecha_anulacion","name_bd_column_hora_anulacion","name_bd_column_neto_pagar","name_bd_column_igtf","name_bd_column_total_pagar","name_bd_column_base_imponible","name_bd_column_monto_iva","name_bd_column_monto_exento","name_bd_column_monto_no_sujeto","name_bd_column_serie_format","name_bd_column_codigo_operacion_format","name_bd_column_correo_cliente","name_bd_column_telefono_cliente","url_prod_anexos","url_qa_anexos","name_bd_column_anexos","name_bd_column_codigo_suscriptor","name_bd_column_tipo_war","connections_string") VALUES(5,'J-30467796-0','HISPANA DE SEGUROS','PROD_HispanaSeguro','/uploads/logo_clientes/c75fae0ae69a9005c2bc2e38a918efb1.jpg','2023-10-15 15:06:56.000','2023-12-10 15:06:58.800',1,'encabezado','NRCONTROLSL','fechaemision_date','YYYY-MM-DD','fechaasignacion_date','YYYY-MM-DD','NFACTURA',NULL,NULL,'https://wsdocdigital-hispana.solucioneslaser.com/hispana-war/recursos/documento/factura/{{encrypt}}',NULL,1,'TIPODOC','{"placeholder":["Factura","Nota de Debito","Nota de Crédito"],"values":[["FA"],["ND"],["NC"]]}',NULL,1,'["codificar","base64"]','{{numero_control}}',NULL,NULL,'RIFCEDULA','NOMBRECLIENTE','CODIGOACTIVIDAD',NULL,'HORADEEMSION','ANULADO','MOTIVOANULACION','FECHAANULACION','HORAANULACION','MONTO_NETO_LOCAL_IGTF','MONTO_IGTF_LOCAL','MONTOBs','IVA','TOTALIVA','TOTALIVA','MONTOBs',NULL,NULL,'correo1','telefono1',NULL,NULL,NULL,NULL,NULL,'Driver=Sybase IQ;Server=HispanaSeguro;CommLinks=tcpip(Host=10.130.0.7:4332);UID=dbawakal;PWD=elite');
INSERT INTO "dba"."clientes" ("id","rif","nombre_cliente","connections","logo","created_at","updated_at","enabled","name_bd_table","name_bd_column_numero_control","name_bd_column_fecha_emision","name_bd_column_fecha_emision_format","name_bd_column_fecha_asignacion","name_bd_column_fecha_asignacion_format","name_bd_column_numero_documento","name_bd_column_numero_documento_format","name_bd_table_coletilla","url_prod","url_qa","is_prod","name_bd_column_tipo_documento","name_bd_column_tipo_documento_format","name_bd_column_tipo_documento_view_pdf_format","numero_control_view_pdf_format","encrypt_url_format","encrypt_url_format_order","name_bd_column_encrypt","name_bd_column_encrypt_others","name_bd_column_rif","name_bd_column_razon_social","name_bd_column_codigo_operacion","name_bd_column_serie","name_bd_column_hora_emision","name_bd_column_status","name_bd_column_motivo_anulacion","name_bd_column_fecha_anulacion","name_bd_column_hora_anulacion","name_bd_column_neto_pagar","name_bd_column_igtf","name_bd_column_total_pagar","name_bd_column_base_imponible","name_bd_column_monto_iva","name_bd_column_monto_exento","name_bd_column_monto_no_sujeto","name_bd_column_serie_format","name_bd_column_codigo_operacion_format","name_bd_column_correo_cliente","name_bd_column_telefono_cliente","url_prod_anexos","url_qa_anexos","name_bd_column_anexos","name_bd_column_codigo_suscriptor","name_bd_column_tipo_war","connections_string") VALUES(6,'J-30083118-3','BANESCO SEGUROS, C.A.','PROD_BanescoSeguros','/uploads/logo_clientes/89be7283e431d9b7aaf3e1789ed5e4ac.jpg','2023-01-12 15:06:56.000','2023-12-10 15:06:58.800',1,'factura','id_unico','FechaDocumento','YYYY-MM-DD','fecharetencioncomprobante','YYYY-MM-DD','NumeroDocumento',NULL,NULL,'https://wakalbanesco-seguros.solucioneslaser.com/Aplicacion/Busquedas/visualizar.php?num={{encrypt}}',NULL,1,'TipoDocumento','{"placeholder":["Factura","Nota de Debito","Nota de Crédito"],"values":[["1"],["2"],["3"]]}',NULL,0,'["base64"]','{{numero_control}}',NULL,NULL,'RIFCliente','nombre',NULL,NULL,'HoraEmision',NULL,NULL,NULL,NULL,'total_pagar','base_imponible_calidad_responsable','total_pagar','MontoBaseimponibleIVA','MontoIva','MontoExento','Precio',NULL,'6512',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Driver=Sybase IQ;Server=BanescoSeguros;CommLinks=tcpip(Host=10.130.0.7:4338);UID=dbawakal;PWD=elite');
INSERT INTO "dba"."clientes" ("id","rif","nombre_cliente","connections","logo","created_at","updated_at","enabled","name_bd_table","name_bd_column_numero_control","name_bd_column_fecha_emision","name_bd_column_fecha_emision_format","name_bd_column_fecha_asignacion","name_bd_column_fecha_asignacion_format","name_bd_column_numero_documento","name_bd_column_numero_documento_format","name_bd_table_coletilla","url_prod","url_qa","is_prod","name_bd_column_tipo_documento","name_bd_column_tipo_documento_format","name_bd_column_tipo_documento_view_pdf_format","numero_control_view_pdf_format","encrypt_url_format","encrypt_url_format_order","name_bd_column_encrypt","name_bd_column_encrypt_others","name_bd_column_rif","name_bd_column_razon_social","name_bd_column_codigo_operacion","name_bd_column_serie","name_bd_column_hora_emision","name_bd_column_status","name_bd_column_motivo_anulacion","name_bd_column_fecha_anulacion","name_bd_column_hora_anulacion","name_bd_column_neto_pagar","name_bd_column_igtf","name_bd_column_total_pagar","name_bd_column_base_imponible","name_bd_column_monto_iva","name_bd_column_monto_exento","name_bd_column_monto_no_sujeto","name_bd_column_serie_format","name_bd_column_codigo_operacion_format","name_bd_column_correo_cliente","name_bd_column_telefono_cliente","url_prod_anexos","url_qa_anexos","name_bd_column_anexos","name_bd_column_codigo_suscriptor","name_bd_column_tipo_war","connections_string") VALUES(7,'J-08518977-7','DROGUERIA NENA C.A.','PROD_dronena','/uploads/logo_clientes/691cadcbc3ceafb3418e86de876822c6.jpg','2023-12-10 15:06:56.911','2023-12-10 15:06:58.800',1,'Encabezado','NUMCONTROL','FECHADOC','YYYY-MM-DD','FECHACONTROL','YYYY-MM-DD','NUMERODOC',NULL,NULL,'https://getdocdigital-dronena.solucioneslaser.com/dronena-war/recursos/documento/ver/{{encrypt}}',NULL,1,'TIPODOC','{"placeholder":["Factura","Nota de Debito","Nota de Crédito","Nota de Entrega"],"values":[["FA"],["ND"],["NC"],["NE"]]}',NULL,0,NULL,NULL,'CONTROLECRIPT',NULL,'RIF','NOMCLI1',NULL,'SERIE','HORADOC','ESTATUS','MOTIVO','FECHAANULADO','HORAANULADO','TOTAL','LINEAPIE3','TOTAL','GRAVADO','MONTOIMPUESTO','EXENTO',NULL,NULL,'4649','correo',NULL,NULL,NULL,NULL,'CODCLI',NULL,'Driver=Sybase IQ;Server=dronena;CommLinks=tcpip(Host=10.130.0.2:4300);UID=dbawakal;PWD=elite');
INSERT INTO "dba"."clientes" ("id","rif","nombre_cliente","connections","logo","created_at","updated_at","enabled","name_bd_table","name_bd_column_numero_control","name_bd_column_fecha_emision","name_bd_column_fecha_emision_format","name_bd_column_fecha_asignacion","name_bd_column_fecha_asignacion_format","name_bd_column_numero_documento","name_bd_column_numero_documento_format","name_bd_table_coletilla","url_prod","url_qa","is_prod","name_bd_column_tipo_documento","name_bd_column_tipo_documento_format","name_bd_column_tipo_documento_view_pdf_format","numero_control_view_pdf_format","encrypt_url_format","encrypt_url_format_order","name_bd_column_encrypt","name_bd_column_encrypt_others","name_bd_column_rif","name_bd_column_razon_social","name_bd_column_codigo_operacion","name_bd_column_serie","name_bd_column_hora_emision","name_bd_column_status","name_bd_column_motivo_anulacion","name_bd_column_fecha_anulacion","name_bd_column_hora_anulacion","name_bd_column_neto_pagar","name_bd_column_igtf","name_bd_column_total_pagar","name_bd_column_base_imponible","name_bd_column_monto_iva","name_bd_column_monto_exento","name_bd_column_monto_no_sujeto","name_bd_column_serie_format","name_bd_column_codigo_operacion_format","name_bd_column_correo_cliente","name_bd_column_telefono_cliente","url_prod_anexos","url_qa_anexos","name_bd_column_anexos","name_bd_column_codigo_suscriptor","name_bd_column_tipo_war","connections_string") VALUES(8,'J-31650803-0','SOLUCIONES DE LOCALIZACION TRACKER,  C.A.','PROD_tracker','/uploads/logo_clientes/882014e7776fd0c8a669338bba79f877.jpg','2022-05-09 15:06:56.000','2023-12-10 15:06:58.800',1,'(SELECT  f.*,  a.motivo AS motivo_anulado,  a.fecha AS fecha_anulado, a.hora AS hora_anulado, CASE  WHEN a.nro_control IS NOT NULL THEN 1 ELSE 0 END AS anulado FROM  factura f  LEFT JOIN anulado a ON  f.id_unico = a.nro_control) as encabezado','id_unico','FechaDocumento','YYYY-MM-DD','FechaDocumento','YYYY-MM-DD','NumeroDocumento',NULL,NULL,'https://portaldocdigital-tracker.solucioneslaser.com/Aplicacion/Busquedas/visualizar.php?num={{encrypt}}&va={{status}}',NULL,1,'TipoDocumento','{"placeholder":["Factura","Nota de Debito","Nota de Crédito"],"values":[["1"],["2"],["3"]]}',NULL,0,NULL,'{{numero_control}}',NULL,NULL,'RIFCliente','nombre','CodigoOperacion',NULL,'HoraEmision','anulado','motivo_anulado','fecha_anulado','hora_anulado','total_neto','igtf','total_pagar','MontoBaseimponibleIVA','MontoIva','MontoExento',NULL,NULL,NULL,'email','telefono',NULL,NULL,NULL,'numeroPoliza',NULL,'Driver=Sybase IQ;Server=tracker;CommLinks=tcpip(Host=10.130.0.7:2904);UID=dbawakal;PWD=elite');
INSERT INTO "dba"."clientes" ("id","rif","nombre_cliente","connections","logo","created_at","updated_at","enabled","name_bd_table","name_bd_column_numero_control","name_bd_column_fecha_emision","name_bd_column_fecha_emision_format","name_bd_column_fecha_asignacion","name_bd_column_fecha_asignacion_format","name_bd_column_numero_documento","name_bd_column_numero_documento_format","name_bd_table_coletilla","url_prod","url_qa","is_prod","name_bd_column_tipo_documento","name_bd_column_tipo_documento_format","name_bd_column_tipo_documento_view_pdf_format","numero_control_view_pdf_format","encrypt_url_format","encrypt_url_format_order","name_bd_column_encrypt","name_bd_column_encrypt_others","name_bd_column_rif","name_bd_column_razon_social","name_bd_column_codigo_operacion","name_bd_column_serie","name_bd_column_hora_emision","name_bd_column_status","name_bd_column_motivo_anulacion","name_bd_column_fecha_anulacion","name_bd_column_hora_anulacion","name_bd_column_neto_pagar","name_bd_column_igtf","name_bd_column_total_pagar","name_bd_column_base_imponible","name_bd_column_monto_iva","name_bd_column_monto_exento","name_bd_column_monto_no_sujeto","name_bd_column_serie_format","name_bd_column_codigo_operacion_format","name_bd_column_correo_cliente","name_bd_column_telefono_cliente","url_prod_anexos","url_qa_anexos","name_bd_column_anexos","name_bd_column_codigo_suscriptor","name_bd_column_tipo_war","connections_string") VALUES(9,'J-00102174-4','ZOOM INTERNATIONAL SERVICES, C.A','PROD_WakalZoom','/uploads/logo_clientes/26bd197d4af3abd584ff2afa93e0a882.jpg','2022-10-01 15:06:56.000','2023-12-10 15:06:58.800',1,'encabezado','numcontrol','fecha_emision','YYYY-MM-DD','fecha_control','YYYY-MM-DD','nrodocumento','F-0000000001;NC-000000003;ND-000000001',NULL,'https://zoomws.solucioneslaser.com/SWakalZoom-war/recursos/documento/ver/{{encrypt}}',NULL,1,'tipodoccumento','{"placeholder":["Factura","Nota de Debito","Nota de Crédito"],"values":[["FA"],["ND"],["NC"]]}',NULL,1,NULL,'{{numero_control}}',NULL,NULL,'rifcli','nombrecli','codigo_ciiu',NULL,'horaemision','estatus','motivo','fechahoraanulado',NULL,'totalpagar','igtf','totalpagar','baseimp','montoiva','excento',NULL,NULL,NULL,'correocli','telefonocli',NULL,NULL,NULL,'codcliente',NULL,'Driver=Sybase IQ;Server=wakalzoom;CommLinks=tcpip(Host=10.130.0.8:4331);UID=dbawakal;PWD=elite');
INSERT INTO "dba"."clientes" ("id","rif","nombre_cliente","connections","logo","created_at","updated_at","enabled","name_bd_table","name_bd_column_numero_control","name_bd_column_fecha_emision","name_bd_column_fecha_emision_format","name_bd_column_fecha_asignacion","name_bd_column_fecha_asignacion_format","name_bd_column_numero_documento","name_bd_column_numero_documento_format","name_bd_table_coletilla","url_prod","url_qa","is_prod","name_bd_column_tipo_documento","name_bd_column_tipo_documento_format","name_bd_column_tipo_documento_view_pdf_format","numero_control_view_pdf_format","encrypt_url_format","encrypt_url_format_order","name_bd_column_encrypt","name_bd_column_encrypt_others","name_bd_column_rif","name_bd_column_razon_social","name_bd_column_codigo_operacion","name_bd_column_serie","name_bd_column_hora_emision","name_bd_column_status","name_bd_column_motivo_anulacion","name_bd_column_fecha_anulacion","name_bd_column_hora_anulacion","name_bd_column_neto_pagar","name_bd_column_igtf","name_bd_column_total_pagar","name_bd_column_base_imponible","name_bd_column_monto_iva","name_bd_column_monto_exento","name_bd_column_monto_no_sujeto","name_bd_column_serie_format","name_bd_column_codigo_operacion_format","name_bd_column_correo_cliente","name_bd_column_telefono_cliente","url_prod_anexos","url_qa_anexos","name_bd_column_anexos","name_bd_column_codigo_suscriptor","name_bd_column_tipo_war","connections_string") VALUES(10,'J-00091991-7','DOCUMENTOS MERCANTILES, S.A. DOMESA','PROD_Domesa','/uploads/logo_clientes/fcf7eddf7f6ed4f7437c6c9818d3b80f.jpg','2023-05-13 15:06:56.000','2023-12-10 15:06:58.800',1,'( SELECT convert(date, EncabezadoFactura.FECHEMIS, 104) AS fechaemision, EncabezadoFactura.NUMEROCONTROL AS control, EncabezadoFactura.NROFACT AS nro_Fac, EncabezadoFactura.NRORIF AS rif, EncabezadoFactura.TIPODOCUMENTO, EncabezadoFactura.OBSERV4 AS hora, EncabezadoFactura.NUMEROCONTROLENCRIPTADO, EncabezadoFactura.STATUSANULACION, SUBSTRING(EncabezadoFactura.FECHAHORA, 7, 4) || ''-'' || SUBSTRING(EncabezadoFactura.FECHAHORA, 4, 2) || ''-'' || SUBSTRING(EncabezadoFactura.FECHAHORA, 1, 2) AS FECHAASIGNA FROM EncabezadoFactura, ReporteDatos WHERE EncabezadoFactura.NUMEROCONTROL = ReporteDatos.TIPODOCUMENTO UNION ALL SELECT CONVERT( date, DIAEMI1 + ''-'' + MESEMI1 + ''-'' + ANOEMI1, 104 ) AS fechaemision, EncabezadoCredito.NUMEROCONTROL AS control, NRONCR1 AS nro_Fac, NRORIF1 AS rif, EncabezadoCredito.TIPODOCUMENTO, '''' AS hora, EncabezadoCredito.NUMEROCONTROLENCRIPTADO, EncabezadoCredito.STATUSANULACION, SUBSTRING(EncabezadoCredito.FECHAHORA, 7, 4) || ''-'' || SUBSTRING(EncabezadoCredito.FECHAHORA, 4, 2) || ''-'' || SUBSTRING(EncabezadoCredito.FECHAHORA, 1, 2) AS FECHAASIGNA FROM EncabezadoCredito, ReporteDatos WHERE EncabezadoCredito.NUMEROCONTROL = ReporteDatos.TIPODOCUMENTO ) AS encabezado','control','fechaemision','DD-MM-YYYY','FECHAASIGNA','DD-MM-YYYY','nro_Fac',NULL,NULL,'https://wsdomesa.solucioneslaser.com/domesaService-war/recursos/documento/pdf/{{encrypt}}',NULL,1,'TIPODOCUMENTO','{"placeholder":["Factura","Nota de Debito","Nota de Crédito","Guia de Despacho"],"values":[["1", "2"],["5"],["3"],["4"]]}',NULL,1,NULL,NULL,'NUMEROCONTROLENCRIPTADO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Driver=Sybase IQ;Server=Domesa;CommLinks=tcpip(Host=10.130.0.7:4340);UID=dbawakal;PWD=elite');
INSERT INTO "dba"."clientes" ("id","rif","nombre_cliente","connections","logo","created_at","updated_at","enabled","name_bd_table","name_bd_column_numero_control","name_bd_column_fecha_emision","name_bd_column_fecha_emision_format","name_bd_column_fecha_asignacion","name_bd_column_fecha_asignacion_format","name_bd_column_numero_documento","name_bd_column_numero_documento_format","name_bd_table_coletilla","url_prod","url_qa","is_prod","name_bd_column_tipo_documento","name_bd_column_tipo_documento_format","name_bd_column_tipo_documento_view_pdf_format","numero_control_view_pdf_format","encrypt_url_format","encrypt_url_format_order","name_bd_column_encrypt","name_bd_column_encrypt_others","name_bd_column_rif","name_bd_column_razon_social","name_bd_column_codigo_operacion","name_bd_column_serie","name_bd_column_hora_emision","name_bd_column_status","name_bd_column_motivo_anulacion","name_bd_column_fecha_anulacion","name_bd_column_hora_anulacion","name_bd_column_neto_pagar","name_bd_column_igtf","name_bd_column_total_pagar","name_bd_column_base_imponible","name_bd_column_monto_iva","name_bd_column_monto_exento","name_bd_column_monto_no_sujeto","name_bd_column_serie_format","name_bd_column_codigo_operacion_format","name_bd_column_correo_cliente","name_bd_column_telefono_cliente","url_prod_anexos","url_qa_anexos","name_bd_column_anexos","name_bd_column_codigo_suscriptor","name_bd_column_tipo_war","connections_string") VALUES(11,'G-20000199-2','INSTITUTO MUNICIPAL DEL AMBIENTE','PROD_wsima','/uploads/logo_clientes/16c608c841cf4ac8e4f8a6e7f10a5672.jpg','2023-06-07 15:06:56.000','2023-12-10 15:06:58.800',1,'Encabezado','nrocontrol','convert(date,fecha,104)','DD-MM-YYYY','convert(date,fechanrocontrol,104)','DD-MM-YYYY','nrodocumento',NULL,NULL,'https://wsima.solucioneslaser.com/wsima-war/recursos/documento/ver/{{encrypt}}',NULL,1,'tipodocumento','{"placeholder":["Factura","Nota de Debito","Nota de Crédito"],"values":[["FA"],["ND"],["NC"]]}',NULL,1,NULL,'{{tipo_documento}}-{{numero_documento}}/{{numero_control}}',NULL,NULL,'rif','razon',NULL,NULL,'hora','estatus','motivo','fechahoraanulado',NULL,'total',NULL,'total','base','iva','excento',NULL,NULL,'9609','correo',NULL,NULL,NULL,NULL,'codima',NULL,'Driver=Sybase IQ;Server=wsima;CommLinks=tcpip(Host=10.130.0.8:6966);UID=dbawakal;PWD=elite');
INSERT INTO "dba"."clientes" ("id","rif","nombre_cliente","connections","logo","created_at","updated_at","enabled","name_bd_table","name_bd_column_numero_control","name_bd_column_fecha_emision","name_bd_column_fecha_emision_format","name_bd_column_fecha_asignacion","name_bd_column_fecha_asignacion_format","name_bd_column_numero_documento","name_bd_column_numero_documento_format","name_bd_table_coletilla","url_prod","url_qa","is_prod","name_bd_column_tipo_documento","name_bd_column_tipo_documento_format","name_bd_column_tipo_documento_view_pdf_format","numero_control_view_pdf_format","encrypt_url_format","encrypt_url_format_order","name_bd_column_encrypt","name_bd_column_encrypt_others","name_bd_column_rif","name_bd_column_razon_social","name_bd_column_codigo_operacion","name_bd_column_serie","name_bd_column_hora_emision","name_bd_column_status","name_bd_column_motivo_anulacion","name_bd_column_fecha_anulacion","name_bd_column_hora_anulacion","name_bd_column_neto_pagar","name_bd_column_igtf","name_bd_column_total_pagar","name_bd_column_base_imponible","name_bd_column_monto_iva","name_bd_column_monto_exento","name_bd_column_monto_no_sujeto","name_bd_column_serie_format","name_bd_column_codigo_operacion_format","name_bd_column_correo_cliente","name_bd_column_telefono_cliente","url_prod_anexos","url_qa_anexos","name_bd_column_anexos","name_bd_column_codigo_suscriptor","name_bd_column_tipo_war","connections_string") VALUES(12,'J-31286704-3','TODOTICKET  2004 C.A','PROD_todoticket','/uploads/logo_clientes/94673de3835f63b7f7517f4497872191.jpg','2023-02-07 15:06:56.000','2023-12-10 15:06:58.800',1,'( SELECT e.*, r.* ,i.correo_cliente   FROM encabezado e  LEFT JOIN resumen r ON e.control = r.control  LEFT JOIN imprenta i ON e.control = i.control ) as encabezado','controln','fechaemisiondate','YYYY-MM-DD','fechaemisiondate','YYYY-MM-DD','num_fact',NULL,NULL,'https://wstodoticket.solucioneslaser.com/todoticketservicio-war/recursos/documento/pdf/{{encrypt}}',NULL,1,'tipo','{"placeholder": ["Factura","Nota de Debito","Nota de Crédito"],"values": [["F1","F2"], ["ND"], ["NC"]]}',NULL,1,'["codificar","base64"]','{{numero_control}}{{tipo_documento}}',NULL,NULL,'rif_cliente','razon_cliente',NULL,NULL,'hora_emision','anulado','motivo','fehca_anulacion','hora_anulacion','monto_total','rubro_monto_igtf_3','monto_total','base_impo_16','iva_16',NULL,NULL,NULL,'9609','correo_cliente','telefono',NULL,NULL,NULL,'codigo_sap',NULL,'Driver=Sybase IQ;Server=todoTicket;CommLinks=tcpip(Host=172.16.2.38:4336);UID=dbawakal;PWD=elite');
INSERT INTO "dba"."clientes" ("id","rif","nombre_cliente","connections","logo","created_at","updated_at","enabled","name_bd_table","name_bd_column_numero_control","name_bd_column_fecha_emision","name_bd_column_fecha_emision_format","name_bd_column_fecha_asignacion","name_bd_column_fecha_asignacion_format","name_bd_column_numero_documento","name_bd_column_numero_documento_format","name_bd_table_coletilla","url_prod","url_qa","is_prod","name_bd_column_tipo_documento","name_bd_column_tipo_documento_format","name_bd_column_tipo_documento_view_pdf_format","numero_control_view_pdf_format","encrypt_url_format","encrypt_url_format_order","name_bd_column_encrypt","name_bd_column_encrypt_others","name_bd_column_rif","name_bd_column_razon_social","name_bd_column_codigo_operacion","name_bd_column_serie","name_bd_column_hora_emision","name_bd_column_status","name_bd_column_motivo_anulacion","name_bd_column_fecha_anulacion","name_bd_column_hora_anulacion","name_bd_column_neto_pagar","name_bd_column_igtf","name_bd_column_total_pagar","name_bd_column_base_imponible","name_bd_column_monto_iva","name_bd_column_monto_exento","name_bd_column_monto_no_sujeto","name_bd_column_serie_format","name_bd_column_codigo_operacion_format","name_bd_column_correo_cliente","name_bd_column_telefono_cliente","url_prod_anexos","url_qa_anexos","name_bd_column_anexos","name_bd_column_codigo_suscriptor","name_bd_column_tipo_war","connections_string") VALUES(13,'J-30259700-5','GALAXY ENTERTAINMENT DE VENEZUELA, S.C.A.','PROD_simpletv032','/uploads/logo_clientes/e3f3b6ce8b75dafc2ff5a13c47910932.jpg','2023-03-01 15:06:56.000','2023-12-10 15:06:58.800',1,'{{Mes}}Encabezado','controln','fecha_emisiond','YYYY-MM-DD','fecha_asignacion','YYYY-MM-DD','numero_factura',NULL,'coletilla','https://wsdocdigital-simpletv.solucioneslaser.com/simpleTv032172023-war/recursos/documento/pdf/{{encrypt}}',NULL,1,'invodoctupe','{"placeholder":["Factura","Nota de Debito","Nota de Crédito"],"values":[["1"],["3"],["2"]]}','[["FC"], ["ND"], ["NC"]]',0,'["codificar","base64"]','{{mes}}{{tipo_documento}}{{numero_documento}}',NULL,NULL,'cedula_rif','nombre_cliente',NULL,NULL,'hora_emision',NULL,NULL,NULL,NULL,'total_bs','amountigtf','total_bs','monto_bs','iva_bs',NULL,NULL,NULL,'420','email','telefono',NULL,NULL,NULL,'numero_cliente',NULL,'Driver=Sybase IQ;Server=simpletv032;CommLinks=tcpip(Host=10.130.0.2:2997);UID=dbawakal;PWD=elite');
INSERT INTO "dba"."clientes" ("id","rif","nombre_cliente","connections","logo","created_at","updated_at","enabled","name_bd_table","name_bd_column_numero_control","name_bd_column_fecha_emision","name_bd_column_fecha_emision_format","name_bd_column_fecha_asignacion","name_bd_column_fecha_asignacion_format","name_bd_column_numero_documento","name_bd_column_numero_documento_format","name_bd_table_coletilla","url_prod","url_qa","is_prod","name_bd_column_tipo_documento","name_bd_column_tipo_documento_format","name_bd_column_tipo_documento_view_pdf_format","numero_control_view_pdf_format","encrypt_url_format","encrypt_url_format_order","name_bd_column_encrypt","name_bd_column_encrypt_others","name_bd_column_rif","name_bd_column_razon_social","name_bd_column_codigo_operacion","name_bd_column_serie","name_bd_column_hora_emision","name_bd_column_status","name_bd_column_motivo_anulacion","name_bd_column_fecha_anulacion","name_bd_column_hora_anulacion","name_bd_column_neto_pagar","name_bd_column_igtf","name_bd_column_total_pagar","name_bd_column_base_imponible","name_bd_column_monto_iva","name_bd_column_monto_exento","name_bd_column_monto_no_sujeto","name_bd_column_serie_format","name_bd_column_codigo_operacion_format","name_bd_column_correo_cliente","name_bd_column_telefono_cliente","url_prod_anexos","url_qa_anexos","name_bd_column_anexos","name_bd_column_codigo_suscriptor","name_bd_column_tipo_war","connections_string") VALUES(14,'J-00220608-0','TRANSFERENCIAS Y ENCOMIENDAS ANGULO LOPEZ, C.A.','PROD_tealca032','/uploads/logo_clientes/2904169cca9f0e6536032a77213efcea.jpg','2024-01-16 16:20:28.000','2024-03-27 16:20:28.124',1,'encabezado','num_control','fecha_proceso','YYYY-MM-DD','fecha_proceso','YYYY-MM-DD','num_documento',NULL,NULL,'https://getdocdigital-tealca.solucioneslaser.com/Tealca/recursos/documento/ver/{{encrypt}}',NULL,1,'document_type','{"placeholder":["Factura","Nota de Debito","Nota de Crédito"],"values":[["invoice"],["debit_note"],["credit_note"]]}',NULL,0,NULL,NULL,'num_control_encriptado',NULL,'customer_document','customer_nombre',NULL,NULL,'hora_proceso','is_anulado','motivo_anulado','fechaAnulacion','HoraAnulacion','total','igtf_amount','total_without_igtf','taxable_total','iva_amount','non_taxable_total',NULL,NULL,NULL,'correo',NULL,NULL,NULL,NULL,NULL,NULL,'Driver=Sybase IQ;Server=tealca032;CommLinks=tcpip(Host=10.130.0.5:2901);UID=dbawakal;PWD=elite');
INSERT INTO "dba"."clientes" ("id","rif","nombre_cliente","connections","logo","created_at","updated_at","enabled","name_bd_table","name_bd_column_numero_control","name_bd_column_fecha_emision","name_bd_column_fecha_emision_format","name_bd_column_fecha_asignacion","name_bd_column_fecha_asignacion_format","name_bd_column_numero_documento","name_bd_column_numero_documento_format","name_bd_table_coletilla","url_prod","url_qa","is_prod","name_bd_column_tipo_documento","name_bd_column_tipo_documento_format","name_bd_column_tipo_documento_view_pdf_format","numero_control_view_pdf_format","encrypt_url_format","encrypt_url_format_order","name_bd_column_encrypt","name_bd_column_encrypt_others","name_bd_column_rif","name_bd_column_razon_social","name_bd_column_codigo_operacion","name_bd_column_serie","name_bd_column_hora_emision","name_bd_column_status","name_bd_column_motivo_anulacion","name_bd_column_fecha_anulacion","name_bd_column_hora_anulacion","name_bd_column_neto_pagar","name_bd_column_igtf","name_bd_column_total_pagar","name_bd_column_base_imponible","name_bd_column_monto_iva","name_bd_column_monto_exento","name_bd_column_monto_no_sujeto","name_bd_column_serie_format","name_bd_column_codigo_operacion_format","name_bd_column_correo_cliente","name_bd_column_telefono_cliente","url_prod_anexos","url_qa_anexos","name_bd_column_anexos","name_bd_column_codigo_suscriptor","name_bd_column_tipo_war","connections_string") VALUES(15,'J-30818251-6','CORPORACION FIBEX TELECOM, C.A.','PROD_fibex','/uploads/logo_clientes/27b8c957dd138fa1ca2fbdf46bcc8530.jpg','2024-02-07 16:21:55.000','2024-03-27 16:21:55.066',1,'encabezado','nrocontrol','convert(date,fechaemision,103)','DD/MM/YYYY','convert(date,fechacontrol,103)','DD/MM/YYYY','nrodocumento',NULL,NULL,'https://wsdocdigital-fibex.solucioneslaser.com/fibex-war/recursos/documento/ver/{{encrypt}}',NULL,1,'tipodocumento','{"placeholder":["Factura","Nota de Debito","Nota de Crédito"],"values":[["FA"],["ND"],["NC"]]}',NULL,0,NULL,'{{tipo_documento}}-{{numero_documento}}',NULL,NULL,'rif','razonsocial',NULL,NULL,'horaemision','estatus','motivo','fechahoraanulado',NULL,'totalpagarbs','igtfbs','totalpagarbs','baseimpbs','ivabs','totalpagarbs',NULL,NULL,'6190','correocli','telefono',NULL,NULL,NULL,NULL,NULL,'Driver=Sybase IQ;Server=fibex;CommLinks=tcpip(Host=172.16.2.38:6965);UID=dbawakal;PWD=elite');
INSERT INTO "dba"."clientes" ("id","rif","nombre_cliente","connections","logo","created_at","updated_at","enabled","name_bd_table","name_bd_column_numero_control","name_bd_column_fecha_emision","name_bd_column_fecha_emision_format","name_bd_column_fecha_asignacion","name_bd_column_fecha_asignacion_format","name_bd_column_numero_documento","name_bd_column_numero_documento_format","name_bd_table_coletilla","url_prod","url_qa","is_prod","name_bd_column_tipo_documento","name_bd_column_tipo_documento_format","name_bd_column_tipo_documento_view_pdf_format","numero_control_view_pdf_format","encrypt_url_format","encrypt_url_format_order","name_bd_column_encrypt","name_bd_column_encrypt_others","name_bd_column_rif","name_bd_column_razon_social","name_bd_column_codigo_operacion","name_bd_column_serie","name_bd_column_hora_emision","name_bd_column_status","name_bd_column_motivo_anulacion","name_bd_column_fecha_anulacion","name_bd_column_hora_anulacion","name_bd_column_neto_pagar","name_bd_column_igtf","name_bd_column_total_pagar","name_bd_column_base_imponible","name_bd_column_monto_iva","name_bd_column_monto_exento","name_bd_column_monto_no_sujeto","name_bd_column_serie_format","name_bd_column_codigo_operacion_format","name_bd_column_correo_cliente","name_bd_column_telefono_cliente","url_prod_anexos","url_qa_anexos","name_bd_column_anexos","name_bd_column_codigo_suscriptor","name_bd_column_tipo_war","connections_string") VALUES(16,'J-30819225-2','RUTAS AEREAS DE VENEZUELA RAV, S.A. (RAVSA)','PROD_venezolana-service','/uploads/logo_clientes/55081230568391f44c7e1cbdecd521c1.jpg','2024-03-01 13:05:58.000','2024-03-27 13:05:58.695',1,'( SELECT e.*, t.subtotalesUSD, t.subtotalesVED, t.ExentoUSD, t.ExentoVED, t.bigUSD16, t.bigVED16, t.ivaUSD16, t.ivaVED16, t.bigUSD8, t.bigVED8, t.ivaUSD8, t.ivaVED8, t.totalUSD, t.totalVED, t.igtfUSD, t.igtfVED, t.TotalPagarUSD, t.TotalPagarVED, t.comisionUSD, t.comisionVED, t.baseUSD, t.baseVED, t.iva0USD, t.iva0VED  FROM encabezado e LEFT JOIN totales t ON e.nroControl = t.nroControl ) AS Encabezado','nroControl','FechaEmision','YYYY-MM-DD','fechaEmision','YYYY-MM-DD','nroDocumento','000000028015',NULL,'https://wsdocdigital-lavzlana.solucioneslaser.com/Venezolana-war/recursos/doc/generar/{{encrypt}}',NULL,1,'tipoDoc','{"placeholder":["Factura","Nota de Debito","Nota de Crédito"],"values":[["FA"],["ND"],["NC"]]}',NULL,0,NULL,NULL,'encriptacion',NULL,'rif','razonSocial',NULL,'serie','horaEmision','statusAnulacion','motivoAnulacion','fechaAnulacion',NULL,'subtotalesVED','igtfVED','totalVED','ivaVED16','ivaVED8','ExentoVED',NULL,'{"placeholder": ["AGV","SERIE A","SERIE B","SERIE C","SERIE D","SERIE E","SERIE F","SERIE H","SERIE I","SERIE K","SERIE L","SERIE M","SERIE O"],"values": [["AGV"],["SERIE A"],["SERIE B"],["SERIE C"],["SERIE D"],["SERIE E"],["SERIE F"],["SERIE H"],["SERIE I"],["SERIE K"],["SERIE L"],["SERIE M"],["SERIE O"]]}','9609','email',NULL,NULL,NULL,NULL,NULL,NULL,'Driver=Sybase IQ;Server=venezolana-service;CommLinks=tcpip(Host=10.130.0.2:4447);UID=dbawakal;PWD=elite');
INSERT INTO "dba"."clientes" ("id","rif","nombre_cliente","connections","logo","created_at","updated_at","enabled","name_bd_table","name_bd_column_numero_control","name_bd_column_fecha_emision","name_bd_column_fecha_emision_format","name_bd_column_fecha_asignacion","name_bd_column_fecha_asignacion_format","name_bd_column_numero_documento","name_bd_column_numero_documento_format","name_bd_table_coletilla","url_prod","url_qa","is_prod","name_bd_column_tipo_documento","name_bd_column_tipo_documento_format","name_bd_column_tipo_documento_view_pdf_format","numero_control_view_pdf_format","encrypt_url_format","encrypt_url_format_order","name_bd_column_encrypt","name_bd_column_encrypt_others","name_bd_column_rif","name_bd_column_razon_social","name_bd_column_codigo_operacion","name_bd_column_serie","name_bd_column_hora_emision","name_bd_column_status","name_bd_column_motivo_anulacion","name_bd_column_fecha_anulacion","name_bd_column_hora_anulacion","name_bd_column_neto_pagar","name_bd_column_igtf","name_bd_column_total_pagar","name_bd_column_base_imponible","name_bd_column_monto_iva","name_bd_column_monto_exento","name_bd_column_monto_no_sujeto","name_bd_column_serie_format","name_bd_column_codigo_operacion_format","name_bd_column_correo_cliente","name_bd_column_telefono_cliente","url_prod_anexos","url_qa_anexos","name_bd_column_anexos","name_bd_column_codigo_suscriptor","name_bd_column_tipo_war","connections_string") VALUES(17,'J-003274445','Cestaticket Services, C.A','PROD_Cestaticket','/uploads/logo_clientes/85e9e2e4b12ebefff8297733acbea999.jpg','2024-04-25 16:12:50.000','2024-05-13 16:12:50.835',1,'( SELECT * FROM ( ( SELECT DISTINCT * FROM ( SELECT otras.control, ''D'' as serie, otras.rif as rif, otras.factura_fiscal_nro as numdoc, CAST(otras.total_factura AS VARCHAR) as total_neto_pagar, ''0.00'' as IGTF, CAST(otras.total_factura AS VARCHAR) as total_a_pagar, CAST(otras.base_imponible as VARCHAR) as base_imponible_iva, CAST(otras.total_iva as VARCHAR) as monto_iva, CAST(otras.monto_no_sujeto_a_iva as VARCHAR) as monto_no_sujeto, otras.fecha_asignacion as fecha_asignacion, ''otras_factura'' as tabla, ''otras/FA'' as ruta_url, ''FA'' as tipoDoc, otras.fecha_emision as fecha_emision, otras.fecha_emision_texto as hora_emision, otras.nombre_cliente as nombre_cliente, NULL as tipoFacturaEmision, NULL as montoNoGravable, NULL as tipoFacturaCredito, a.motivo_anulacion, a.fecha_anulacion, a.hora_anulacion, correo, '''' as telefono, codigo_cliente FROM otras_factura otras LEFT JOIN anulado a ON otras.control = a.nro_control UNION ALL SELECT seried.control, ''D'' as serie, seried.cirif as rif, seried.numnot as numdoc, seried.totnotcre as total_neto_pagar, ''0.00'' as IGTF, seried.monto as total_a_pagar, seried.basimp as base_imponible_iva, seried.iva as monto_iva, seried.monnosujiva as monto_no_sujeto, seried.fecasi as fecha_asignacion, ''seried_notas'' as tabla, ''otras'' as ruta_url, CASE WHEN tipo = ''01'' THEN ''NC'' WHEN tipo = ''02'' THEN ''ND'' ELSE ''x'' END AS tipoDoc, seried.fecemi as fecha_emision, seried.horemi as hora_emision, seried.cliente as nombre_cliente, NULL as tipoFacturaEmision, NULL as montoNoGravable, NULL as tipoFacturaCredito, a.motivo_anulacion, a.fecha_anulacion, a.hora_anulacion, correo, '''' as telefono, numcli as codigo_cliente FROM seried_notas seried LEFT JOIN anulado a ON seried.control = a.nro_control UNION ALL SELECT ef.control, ''A'' as serie, ef.rif as rif, ef.factura_fiscal_nro as numdoc, CAST(ef.monto_neto_a_pagar AS VARCHAR) as total_neto_pagar, ''0.00'' as IGTF, CAST(ef.monto_neto_a_pagar AS VARCHAR) as total_a_pagar, CAST(ef.base_imponible as VARCHAR) as base_imponible_iva, CAST(ef.total_iva as VARCHAR) as monto_iva, CAST(ef.monto_no_sujeto_a_iva as VARCHAR) as monto_no_sujeto, ef.fecha_asignacion as fecha_asignacion, ''emision_factura'' as tabla, ''emision/FA'' as ruta_url, ''FA'' as tipoDoc, ef.fecha_emision as fecha_emision, ef.fecha_emision_texto as hora_emision, ef.nombre_cliente as nombre_cliente, ef.tipo_factura as tipoFacturaEmision, ef.monto_nogravable as montoNoGravable, NULL as tipoFacturaCredito, a.motivo_anulacion, a.fecha_anulacion, a.hora_anulacion, mail_responsable as correo, telefono, codigo_cliente FROM emision_factura ef LEFT JOIN anulado a ON ef.control = a.nro_control UNION ALL SELECT ec.control, ''A'' as serie, ec.rif as rif, ec.numero_nc as numdoc, CAST(ec.total_nc AS VARCHAR) as total_neto_pagar, ''0.00'' as IGTF, CAST(ec.total_nc AS VARCHAR) as total_a_pagar, CAST(ec.base_imponible_comision as VARCHAR) as base_imponible_iva, CAST(ec.monto_iva_comision as VARCHAR) as monto_iva, CAST(ec.monto_no_sujeto_iva as VARCHAR) as monto_no_sujeto, ec.fecha_asignacion as fecha_asignacion, ''emision_credito'' as tabla, ''emision/NC'' as ruta_url, ''NC'' as tipoDoc, ec.fecha_emision as fecha_emision, ec.fecha_emision_texto as hora_emision, ec.nombre_cliente as nombre_cliente, NULL as tipoFacturaEmision, NULL as montoNoGravable, ''nah'' as tipoFacturaCredito, a.motivo_anulacion, a.fecha_anulacion, a.hora_anulacion, mail_responsable as correo, '''' as telefono, codigo_cliente FROM emision_credito ec LEFT JOIN anulado a ON ec.control = a.nro_control UNION ALL SELECT rf.control, ''B'' as serie, rf.rif as rif, rf.factura_fiscal_nro as numdoc, rf.total_factura as total_neto_pagar, ''0.00'' as IGTF, rf.total_reembolso as total_a_pagar, rf.base_imponible as base_imponible_iva, total_iva as monto_iva, ''0.00'' as monto_no_sujeto, rf.fecha_asignacion as fecha_asignacion, ''reembolso_factura'' as tabla, ''reembolso/FA'' as ruta_url, ''FA'' as tipoDoc, rf.fecha_emision as fecha_emision, rf.hora_asignacion as hora_emision, rf.nombre_afiliado as nombre_cliente, NULL as tipoFacturaEmision, NULL as montoNoGravable, NULL as tipoFacturaCredito, a.motivo_anulacion, a.fecha_anulacion, a.hora_anulacion, '''' as correo, '''' as telefono, codigo_afiliado as codigo_cliente FROM reembolso_factura rf LEFT JOIN anulado a ON rf.control = a.nro_control UNION ALL SELECT serieb.control, ''B'' as serie, serieb.rif as rif, serieb.numnot as numdoc, serieb.totnot as total_neto_pagar, ''0.00'' as IGTF, serieb.monbs as total_a_pagar, serieb.basimp as base_imponible_iva, serieb.moniva as monto_iva, ''0.00'' as monto_no_sujeto, serieb.fecasi as fecha_asignacion, ''serieb_notas'' as tabla, ''reembolso'' as ruta_url, CASE WHEN tipo in (''01'', ''03'') THEN ''NC'' WHEN tipo in (''02'', ''04'') THEN ''ND'' ELSE ''x'' END AS tipoDoc, serieb.fecemi as fecha_emision, serieb.horemi as hora_emision, serieb.nomafi as nombre_cliente, NULL as tipoFacturaEmision, NULL as montoNoGravable, NULL as tipoFacturaCredito, a.motivo_anulacion, a.fecha_anulacion, a.hora_anulacion, correo, '''' as telefono, codafi as codigo_cliente FROM serieb_notas serieb LEFT JOIN anulado a ON serieb.control = a.nro_control UNION ALL SELECT serieE.control, ''E'' as serie, serieE.rif as rif, serieE.numfac as numdoc, CAST(serieE.monnetpag AS VARCHAR) as total_neto_pagar, CAST(serieE.igtfext AS VARCHAR) as IGTF, CAST(serieE.totfac AS VARCHAR) as total_a_pagar, CAST(serieE.basimpcom as VARCHAR) as base_imponible_iva, CAST(serieE.ivacom as VARCHAR) as monto_iva, CAST(serieE.monnosujiva as VARCHAR) as monto_no_sujeto, serieE.fecasi as fecha_asignacion, ''seriee'' as tabla, ''seriee'' as ruta_url, CASE WHEN tipfac IN (01, 03, 05, 06, 07, 08, 09, 10) THEN ''FA'' WHEN tipfac IN (02, 04, 11, 13, 15, 16) THEN ''NC'' WHEN tipfac IN (12, 14, 17, 18, 19, 20) THEN ''ND'' END AS tipoDoc, serieE.fecemi as fecha_emision, serieE.horemi as hora_emision, serieE.cliente as nombre_cliente, NULL as tipoFacturaEmision, NULL as montoNoGravable, NULL as tipoFacturaCredito, a.motivo_anulacion, a.fecha_anulacion, a.hora_anulacion, correo, telefono, numcli as codigo_cliente FROM seriee serieE LEFT JOIN anulado a ON serieE.control = a.nro_control ) as Busqueda ) as subquery ) ) as encabezado','control','fecha_emision','YYYY-MM-DD','fecha_asignacion','YYY-MM-DD','numdoc',NULL,NULL,'https://getdocdigitalcestaticket.solucioneslaser.com/cestaticket-war/recursos/documento/pdf/{{ruta_url}}/{{encrypt}}',NULL,1,'tipoDoc','{"placeholder":["Factura","Nota de Debito","Nota de Crédito"],"values":[["FA"],["ND"],["NC"]]}',NULL,0,'["base64"]','{{numero_documento}}',NULL,'ruta_url','rif','nombre_cliente',NULL,'serie','hora_emision',NULL,'motivo_anulacion','fecha_anulacion','hora_anulacion','total_neto_pagar','IGTF','total_a_pagar','base_imponible_iva','monto_iva',NULL,'monto_no_sujeto','{"placeholder": ["SERIE A","SERIE B","SERIE D","SERIE E"],"values": [["A"],["B"],["D"],["E"]]}','9999','correo','telefono',NULL,NULL,NULL,'codigo_cliente',NULL,'Driver=Sybase IQ;Server=Cestaticket;CommLinks=tcpip(Host=10.130.0.8:4300);UID=dba;PWD=sql');
INSERT INTO "dba"."clientes" ("id","rif","nombre_cliente","connections","logo","created_at","updated_at","enabled","name_bd_table","name_bd_column_numero_control","name_bd_column_fecha_emision","name_bd_column_fecha_emision_format","name_bd_column_fecha_asignacion","name_bd_column_fecha_asignacion_format","name_bd_column_numero_documento","name_bd_column_numero_documento_format","name_bd_table_coletilla","url_prod","url_qa","is_prod","name_bd_column_tipo_documento","name_bd_column_tipo_documento_format","name_bd_column_tipo_documento_view_pdf_format","numero_control_view_pdf_format","encrypt_url_format","encrypt_url_format_order","name_bd_column_encrypt","name_bd_column_encrypt_others","name_bd_column_rif","name_bd_column_razon_social","name_bd_column_codigo_operacion","name_bd_column_serie","name_bd_column_hora_emision","name_bd_column_status","name_bd_column_motivo_anulacion","name_bd_column_fecha_anulacion","name_bd_column_hora_anulacion","name_bd_column_neto_pagar","name_bd_column_igtf","name_bd_column_total_pagar","name_bd_column_base_imponible","name_bd_column_monto_iva","name_bd_column_monto_exento","name_bd_column_monto_no_sujeto","name_bd_column_serie_format","name_bd_column_codigo_operacion_format","name_bd_column_correo_cliente","name_bd_column_telefono_cliente","url_prod_anexos","url_qa_anexos","name_bd_column_anexos","name_bd_column_codigo_suscriptor","name_bd_column_tipo_war","connections_string") VALUES(18,'J-00012926-6','NESTLE VENEZUELA, S.A','PROD_nestle-Autoventas','/uploads/logo_clientes/b43befbd8668b8c25e15f179f7840106.jpg','2024-03-04 13:18:34.000','2024-05-25 13:18:34.614',1,'(      SELECT e.nroControl, nroDocSL, cliente as nombre_cliente, serie, rif, totalBs as neto_pagar, igtfBs as igtf, subtotalBs as total_pagar, ivaBs as base_imponible, totalExentoBs as monto_iva, fechaEmisionContabilidad as fechaCarga, horaProceso, tipoDoc, encript, statusAnulacion, motivoAnulacion, fechaAnulacion, email as correo, telefono, codCliente as codigo_cliente, ''nestleFina-war'' as tipo_war  FROM Encabezado AS e LEFT JOIN sumario AS s ON e.nroControl = s.nroControl UNION ALL SELECT e.nroControlPreventa as nroControl, nroDocSL, nombreEmisor as nombre_cliente, serie, RIFEmisor as rif, Total as neto_pagar, igtf as igtf, Subtota as total_pagar, MontoIva as base_imponible, Texento as monto_iva, fechaCarga, horaCarga as horaProceso, tipoDoc, encript, statusAnulacion, motivoAnulacion, fechaAnulacion, correo, telfReceptor as telefono, nroCliente as codigo_cliente, ''nestlePre-war'' as tipo_war  FROM Encabezado_Preventas AS e LEFT JOIN sumario_Preventas AS s ON e.nroControlPreventa = s.nroControlPreventa UNION ALL SELECT nroControl, nroDocSL, conductor as nombre_cliente, ''F'' as serie, ciConductor as rif, '''' as neto_pagar, '''' as igtf, '''' as total_pagar, '''' as base_imponible, '''' as monto_iva, fechaCarga, horaCarga as horaProceso, ''GD'' as tipoDoc, encript, '''' as statusAnulacion, '''' as motivoAnulacion, '''' as fechaAnulacion, correo, telefonoConductor as telefono, '''' as codigo_cliente, ''nestlePre-war'' as tipo_war FROM EncabezadoGuiaDespacho UNION ALL SELECT e.nroControlAutoFactura as nroControl, nroDocSL, CUS_Name as nombre_cliente, serie, CUS_RegCode as rif, ValorTotalBS as neto_pagar, '''' as igtf, TotalAmountBS as total_pagar, VAT16BS as base_imponible, TotalExtconDescBS as monto_iva, fechaCarga, horaCarga as horaProceso, ''FA'' as tipoDoc, encript, statusAnulacion, motivoAnulacion, fechaAnulacion, correo, '''' as telefono, CUS_RealID as codigo_cliente, ''nestleAut-war'' as tipo_war FROM Encabezado_AutoFactura AS e LEFT JOIN Sumario_AutoFactura AS s ON e.nroControlAutoFactura = s.nroControlAutoFactura ) as Encabezado','nroControl','fechaCarga','YYYY-MM-DD','fechaCarga','YYYY-MM-DD','nroDocSL',NULL,NULL,'https://getdocdigitalnestle.solucioneslaser.com/{{tipo_war}}/recursos/doc/pdf/{{encrypt}}',NULL,1,'tipoDoc','{"placeholder":["Factura","Nota de Debito","Nota de Crédito","Guia de Despacho"],"values":[["MI","F2","FA","S1"],["MD","L2","ZL2"],["MC","ZC","RE","S2"],["GD"]]}',NULL,0,NULL,NULL,'encript',NULL,'rif','nombre_cliente',NULL,'serie','horaProceso','statusAnulacion','motivoAnulacion','fechaAnulacion',NULL,'neto_pagar','igtf','total_pagar','base_imponible','monto_iva',NULL,NULL,'{"placeholder": ["SERIE A", "SERIE B", "SERIE D", "SERIE F", "SERIE G", "SERIE H", "SERIE I", "SERIE J", "SERIE K", "SERIE N", "SERIE O", "SERIE P", "SERIE Q", "SERIE U", "SERIE V", "SERIE Z"],"values": [["A"], ["B"], ["D"], ["F"], ["G"], ["H"], ["I"], ["J"], ["K"], ["N"], ["O"], ["P"], ["Q"], ["U"], ["V"], ["Z"]]}','1079','correo','telefono',NULL,NULL,NULL,'codigo_cliente','tipo_war','Driver=Sybase IQ;Server=nestle-Autoventas;CommLinks=tcpip(Host=10.130.0.5:4462);UID=dbawakal;PWD=elite');
INSERT INTO "dba"."clientes" ("id","rif","nombre_cliente","connections","logo","created_at","updated_at","enabled","name_bd_table","name_bd_column_numero_control","name_bd_column_fecha_emision","name_bd_column_fecha_emision_format","name_bd_column_fecha_asignacion","name_bd_column_fecha_asignacion_format","name_bd_column_numero_documento","name_bd_column_numero_documento_format","name_bd_table_coletilla","url_prod","url_qa","is_prod","name_bd_column_tipo_documento","name_bd_column_tipo_documento_format","name_bd_column_tipo_documento_view_pdf_format","numero_control_view_pdf_format","encrypt_url_format","encrypt_url_format_order","name_bd_column_encrypt","name_bd_column_encrypt_others","name_bd_column_rif","name_bd_column_razon_social","name_bd_column_codigo_operacion","name_bd_column_serie","name_bd_column_hora_emision","name_bd_column_status","name_bd_column_motivo_anulacion","name_bd_column_fecha_anulacion","name_bd_column_hora_anulacion","name_bd_column_neto_pagar","name_bd_column_igtf","name_bd_column_total_pagar","name_bd_column_base_imponible","name_bd_column_monto_iva","name_bd_column_monto_exento","name_bd_column_monto_no_sujeto","name_bd_column_serie_format","name_bd_column_codigo_operacion_format","name_bd_column_correo_cliente","name_bd_column_telefono_cliente","url_prod_anexos","url_qa_anexos","name_bd_column_anexos","name_bd_column_codigo_suscriptor","name_bd_column_tipo_war","connections_string") VALUES(19,'J-50356478-4','Latitud Seguros C.A','PROD_LatitudSeguros','/uploads/logo_clientes/a0a9c472157e2618e15f2a6293011908.jpg','2024-06-03 14:02:20.000','2024-06-03 14:02:20.383',1,'documento','num_control_asignado','fecha_emision','YYYY-MM-DD','fecha_control_asignado','YYYY-MM-DD','num_documento_asignado',NULL,NULL,'https://wsdocdigitallatitud.solucioneslaser.com/LatitudSeguros/resources/document/fop/{{encrypt}}',NULL,1,'tipo_documento','{"placeholder":["Factura","Nota de Debito","Nota de Crédito"],"values":[["FAC","FA","FC"],["NC"],["ND"]]}',NULL,0,'["base64"]','{{numero_control_format}}{{tipo_documento}}',NULL,NULL,'id_rif','razon_social','codigo_actividad',NULL,'hora_emision','estatus_anulacion','motivo_anulacion','fecha_anulacion','hora_anulacion','monto_subtotal_bs','monto_IGTF_bs','monto_subtotal_bs','monto_IGTF_bs','monto_iva_bs',NULL,'monto_subtotal_noSujeto_bs',NULL,NULL,'correo1','telefono1',NULL,NULL,NULL,NULL,NULL,'Driver=Sybase IQ;Server=ws_LatitudSeguros;CommLinks=tcpip(Host=10.130.0.8:4501);UID=dbawakal;PWD=elite');
INSERT INTO "dba"."clientes" ("id","rif","nombre_cliente","connections","logo","created_at","updated_at","enabled","name_bd_table","name_bd_column_numero_control","name_bd_column_fecha_emision","name_bd_column_fecha_emision_format","name_bd_column_fecha_asignacion","name_bd_column_fecha_asignacion_format","name_bd_column_numero_documento","name_bd_column_numero_documento_format","name_bd_table_coletilla","url_prod","url_qa","is_prod","name_bd_column_tipo_documento","name_bd_column_tipo_documento_format","name_bd_column_tipo_documento_view_pdf_format","numero_control_view_pdf_format","encrypt_url_format","encrypt_url_format_order","name_bd_column_encrypt","name_bd_column_encrypt_others","name_bd_column_rif","name_bd_column_razon_social","name_bd_column_codigo_operacion","name_bd_column_serie","name_bd_column_hora_emision","name_bd_column_status","name_bd_column_motivo_anulacion","name_bd_column_fecha_anulacion","name_bd_column_hora_anulacion","name_bd_column_neto_pagar","name_bd_column_igtf","name_bd_column_total_pagar","name_bd_column_base_imponible","name_bd_column_monto_iva","name_bd_column_monto_exento","name_bd_column_monto_no_sujeto","name_bd_column_serie_format","name_bd_column_codigo_operacion_format","name_bd_column_correo_cliente","name_bd_column_telefono_cliente","url_prod_anexos","url_qa_anexos","name_bd_column_anexos","name_bd_column_codigo_suscriptor","name_bd_column_tipo_war","connections_string") VALUES(20,'J-30240664-1','Corporación TELEMIC, C. A','PROD_ws_interIQ','/uploads/logo_clientes/53b1cb748f59a4f7c40bcc56280986fd.jpg','2024-07-01 15:55:54.000','2024-07-25 15:55:54.000',1,'(   SELECT  *, CASE  WHEN tipoDocumento = ''GXVision'' THEN ''inter-war/recursos/doc/visual'' WHEN tipoDocumento = ''GXAdmin'' THEN ''inter032-war/recursos/documento/ver'' END AS ruta_url FROM {{Mes}}Descriptor   ) as encabezado','nroControl','fecha_emision','YYYY-MM-DD','fechaAsignacion','YYYY-MM-DD','nroDocumento',NULL,'coletilla','https://wsdocdigitalinter.solucioneslaser.com/{{ruta_url}}/{{encrypt}}',NULL,1,'tipo_documento','{"placeholder":["Factura","Nota de Debito","Nota de Crédito"],"values":[["FA"],["ND"],["NC"]]}',NULL,0,NULL,NULL,'encrypt','ruta_url','rifCliente','nombreCliente','codigo_operacion','serie','horaEmision','anulado','motivo_anulacion','fecha_anulacion','hora_anulacion','neto_pagar','IGTF','total_pagar','base_imponible','monto_iva','monto_exento','monto_no_sujeto','{     "placeholder": [         "MSO-01", "BTO-02", "MBO-02", "ACR-02", "COJ-02", "SJM-02", "MCT-02", "VAL-02", "TIG-02", "ANC-02",         "CBO-02", "MRD-02", "VRA-02", "BRN-02", "SFP-02", "CRA-02", "MSO-03", "MRN-02", "MNT-02", "PTF-02",         "LTQ-02", "CCS-02", "GNA-02", "CUM-02", "BRC-02", "MTR-02", "CHA-02", "MRG-02", "SCT-02", "LGU-02",         "GNR-02", "VIG-02", "SCA-02", "TNQ-02", "YRT-02", "CHI-02", "TNC-02", "COR-02", "PZO-02",                   "BTO-01","MRD-01", "MCY-01", "ACR-01", "SFP-01", "MBO-01", "VAL-01", "CRA-01", "VRA-01", "BRN-01", "PTO-01",         "MNT-01", "GUA-01", "SJM-01", "ANC-01", "TIG-01", "COJ-01", "CBO-01", "MTR-01", "SFA-02", "YRT-01",         "CHA-01", "LTQ-01", "BRC-01", "CCS-01", "TNC-01", "GNA-01", "LGU-01", "SCT-01", "SCR-01", "TNQ-01",         "COR-02", "PTF-01", "MRN-01", "VIG-01", "CUM-01", "CHI-01", "MRG-01", "PAY-01", "TUC-01", "PCA-01",         "CHU-01", "COA-01", "CVA-01", "SNT-01", "URQ-01"     ],     "values": [         ["MSO-01"], ["BTO-02"], ["MBO-02"], ["ACR-02"], ["COJ-02"], ["SJM-02"], ["MCT-02"], ["VAL-02"], ["TIG-02"], ["ANC-02"],         ["CBO-02"], ["MRD-02"], ["VRA-02"], ["BRN-02"], ["SFP-02"], ["CRA-02"], ["MSO-03"], ["MRN-02"], ["MNT-02"], ["PTF-02"],         ["LTQ-02"], ["CCS-02"], ["GNA-02"], ["CUM-02"], ["BRC-02"], ["MTR-02"], ["CHA-02"], ["MRG-02"], ["SCT-02"], ["LGU-02"],         ["GNR-02"], ["VIG-02"], ["SCA-02"], ["TNQ-02"], ["YRT-02"], ["CHI-02"], ["TNC-02"], ["COR-02"], ["PZO-02"],                  ["BTO-01"], ["MRD-01"], ["MCY-01"], ["ACR-01"], ["SFP-01"], ["MBO-01"], ["VAL-01"], ["CRA-01"], ["VRA-01"], ["BRN-01"], ["PTO-01"],         ["MNT-01"], ["GUA-01"], ["SJM-01"], ["ANC-01"], ["TIG-01"], ["COJ-01"], ["CBO-01"], ["MTR-01"], ["SFA-02"], ["YRT-01"],         ["CHA-01"], ["LTQ-01"], ["BRC-01"], ["CCS-01"], ["TNC-01"], ["GNA-01"], ["LGU-01"], ["SCT-01"], ["SCR-01"], ["TNQ-01"],         ["COR-02"], ["PTF-01"], ["MRN-01"], ["VIG-01"], ["CUM-01"], ["CHI-01"], ["MRG-01"], ["PAY-01"], ["TUC-01"], ["PCA-01"],         ["CHU-01"], ["COA-01"], ["CVA-01"], ["SNT-01"], ["URQ-01"]     ],     "permisor": [         "01001", "01004", "01006", "01008", "01010", "01012", "01014", "01016", "01018", "01020",         "01022", "01024", "01026", "01028", "01030", "01032", "01049", "01052", "01053", "01054",         "01059", "01060", "01097", "01098", "01099", "01100", "01101", "01103", "01104", "01105",         "01109", "01110", "01111", "01112", "01113", "01115", "01116", "01127", "01128",                  "00001", "00002", "00003", "00004", "00005", "00006", "00007", "00008", "00009", "00010",         "00011", "00012", "00013", "00014", "00015", "00016", "00017", "00018", "00019", "00020",         "00021", "00022", "00023", "00024", "00025", "00026", "00028", "00030", "00031", "00035",         "00036", "00037", "00040", "00041", "00042", "00044", "00054", "00055", "00058", "00059",         "00060", "00061", "00062", "00063", "00064", "00065"     ] }',NULL,'correo_cliente','telefono_cliente',NULL,NULL,NULL,NULL,NULL,'Driver=Sybase IQ;Server=ws_interIQ;CommLinks=tcpip(Host=10.130.1.52:4343);UID=dbawakal;PWD=elite')


CREATE TABLE consultas (
	"id" INTEGER NOT NULL DEFAULT AUTOINCREMENT UNIQUE,
	"nombre" VARCHAR(255) NOT NULL,
	"cliente_id" INTEGER NOT NULL,
	"created_at" TIMESTAMP NULL DEFAULT CURRENT TIMESTAMP,
	"updated_at" TIMESTAMP NULL DEFAULT CURRENT TIMESTAMP,
	PRIMARY KEY ( "id" ASC )
) IN "system";

CREATE TABLE parametros (
	"id" INTEGER NOT NULL DEFAULT AUTOINCREMENT UNIQUE,
	"name" VARCHAR(255) NOT NULL,
	"tipo_input" VARCHAR(255) NOT NULL,
	"placeholder" VARCHAR(255) NULL,
	"column_reference_cliente" VARCHAR(255) NOT NULL,
	"created_at" TIMESTAMP NULL DEFAULT CURRENT TIMESTAMP,
	"updated_at" TIMESTAMP NULL DEFAULT CURRENT TIMESTAMP,
	PRIMARY KEY ( "id" ASC )
) IN "system";

INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(241,'Número de Control',49,'2024-06-03 14:35:42.838','2024-06-03 14:35:42.838');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(261,'Número de Control',1,'2024-06-06 13:32:08.166','2024-06-06 13:32:08.166');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(262,'Número de Documento',1,'2024-06-06 13:32:19.773','2024-06-06 13:32:19.773');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(268,'Tipo de Documento',1,'2024-06-06 13:36:47.071','2024-06-06 13:36:47.071');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(269,'Fecha Emisión/Asignación',1,'2024-06-06 13:37:16.919','2024-06-06 13:37:16.919');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(255,'Número de Control',6,'2024-06-06 13:19:53.285','2024-06-06 13:19:53.285');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(256,'Número de Documento',6,'2024-06-06 13:20:11.059','2024-06-06 13:20:11.059');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(257,'Tipo de Documento',6,'2024-06-06 13:20:31.710','2024-06-06 13:20:31.710');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(258,'Fecha Emisión/Asignación',6,'2024-06-06 13:20:50.206','2024-06-06 13:20:50.206');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(259,'Número de RIF/CI',6,'2024-06-06 13:21:04.172','2024-06-06 13:21:04.172');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(260,'Razón Social',6,'2024-06-06 13:21:30.889','2024-06-06 13:21:30.889');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(270,'Número de RIF/CI',1,'2024-06-06 13:37:30.818','2024-06-06 13:37:30.818');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(271,'Razón Social',1,'2024-06-06 13:37:46.232','2024-06-06 13:37:46.232');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(272,'Codigo Cliente',1,'2024-06-06 13:38:31.011','2024-06-06 13:38:31.011');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(279,'Número de Control',2,'2024-06-07 16:55:09.892','2024-06-07 16:55:09.892');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(280,'Número de Documento',2,'2024-06-07 16:55:20.596','2024-06-07 16:55:20.596');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(281,'Tipo de Documento',2,'2024-06-07 16:55:34.099','2024-06-07 16:55:34.099');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(282,'Fecha Emisión/Asignación',2,'2024-06-07 16:55:46.788','2024-06-07 16:55:46.788');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(283,'Número de RIF/CI',2,'2024-06-07 16:56:02.899','2024-06-07 16:56:02.899');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(284,'Razón Social',2,'2024-06-07 16:56:16.414','2024-06-07 16:56:16.414');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(285,'Número de Control',3,'2024-06-07 16:58:35.362','2024-06-07 16:58:35.362');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(286,'Número de Documento',3,'2024-06-07 16:58:51.902','2024-06-07 16:58:51.902');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(287,'Tipo de Documento',3,'2024-06-07 16:59:11.150','2024-06-07 16:59:11.150');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(288,'Fecha Emisión/Asignación',3,'2024-06-07 16:59:25.181','2024-06-07 16:59:25.181');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(290,'Número de Control',4,'2024-06-07 17:00:29.526','2024-06-07 17:00:29.526');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(291,'Número de Documento',4,'2024-06-07 17:00:40.671','2024-06-07 17:00:40.671');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(292,'Tipo de Documento',4,'2024-06-07 17:01:07.303','2024-06-07 17:01:07.303');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(293,'Fecha Emisión/Asignación',4,'2024-06-07 17:01:19.375','2024-06-07 17:01:19.375');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(296,'Número de RIF/CI',4,'2024-06-07 17:02:16.014','2024-06-07 17:02:16.014');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(297,'Razón Social',4,'2024-06-07 17:02:29.198','2024-06-07 17:02:29.198');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(298,'Número de RIF/CI',3,'2024-06-07 17:03:03.599','2024-06-07 17:03:03.599');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(299,'Razón Social',3,'2024-06-07 17:03:16.130','2024-06-07 17:03:16.130');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(300,'Número de Control',5,'2024-06-07 17:04:43.637','2024-06-07 17:04:43.637');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(301,'Número de Documento',5,'2024-06-07 17:04:57.122','2024-06-07 17:04:57.122');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(302,'Tipo de Documento',5,'2024-06-07 17:05:53.440','2024-06-07 17:05:53.440');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(303,'Fecha Emisión/Asignación',5,'2024-06-07 17:06:05.441','2024-06-07 17:06:05.441');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(304,'Número de RIF/CI',5,'2024-06-07 17:06:18.919','2024-06-07 17:06:18.919');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(305,'Razón Social',5,'2024-06-07 17:06:32.031','2024-06-07 17:06:32.031');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(306,'Número de Control',7,'2024-06-07 17:09:03.861','2024-06-07 17:09:03.861');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(307,'Número de Documento',7,'2024-06-07 17:11:37.389','2024-06-07 17:11:37.389');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(308,'Tipo de Documento',7,'2024-06-07 17:12:00.741','2024-06-07 17:12:00.741');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(310,'Fecha Emisión/Asignación',7,'2024-06-07 17:12:34.391','2024-06-07 17:12:34.391');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(311,'Número de RIF/CI',7,'2024-06-07 17:12:56.283','2024-06-07 17:12:56.283');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(312,'Razón Social',7,'2024-06-07 17:13:10.016','2024-06-07 17:13:10.016');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(313,'Número de Control',8,'2024-06-07 17:13:53.879','2024-06-07 17:13:53.879');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(314,'Número de Documento',8,'2024-06-07 17:14:10.159','2024-06-07 17:14:10.159');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(315,'Tipo de Documento',8,'2024-06-07 17:14:48.925','2024-06-07 17:14:48.925');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(316,'Fecha Emisión/Asignación',8,'2024-06-07 17:14:58.712','2024-06-07 17:14:58.712');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(318,'Número de RIF/CI',8,'2024-06-07 17:15:31.486','2024-06-07 17:15:31.486');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(319,'Razón Social',8,'2024-06-07 17:15:43.156','2024-06-07 17:15:43.156');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(320,'Número de Control',9,'2024-06-07 17:16:41.616','2024-06-07 17:16:41.616');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(321,'Número de Documento',9,'2024-06-07 17:16:54.054','2024-06-07 17:16:54.054');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(323,'Tipo de Documento',9,'2024-06-07 17:17:19.621','2024-06-07 17:17:19.621');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(324,'Fecha Emisión/Asignación',9,'2024-06-07 17:17:28.302','2024-06-07 17:17:28.302');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(325,'Número de RIF/CI',9,'2024-06-07 17:17:45.006','2024-06-07 17:17:45.006');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(326,'Razón Social',9,'2024-06-07 17:18:03.752','2024-06-07 17:18:03.752');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(327,'Número de Control',10,'2024-06-07 17:20:41.677','2024-06-07 17:20:41.677');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(328,'Número de Documento',10,'2024-06-07 17:20:50.261','2024-06-07 17:20:50.261');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(329,'Tipo de Documento',10,'2024-06-07 17:21:02.519','2024-06-07 17:21:02.519');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(330,'Fecha Emisión/Asignación',10,'2024-06-07 17:21:10.644','2024-06-07 17:21:10.644');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(331,'Número de RIF/CI',10,'2024-06-07 17:21:21.298','2024-06-07 17:21:21.298');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(332,'Razón Social',10,'2024-06-07 17:21:41.061','2024-06-07 17:21:41.061');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(333,'Número de Control',11,'2024-06-07 17:22:22.663','2024-06-07 17:22:22.663');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(334,'Número de Documento',11,'2024-06-07 17:22:32.206','2024-06-07 17:22:32.206');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(335,'Tipo de Documento',11,'2024-06-07 17:22:40.214','2024-06-07 17:22:40.214');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(336,'Fecha Emisión/Asignación',11,'2024-06-07 17:23:00.062','2024-06-07 17:23:00.062');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(337,'Número de RIF/CI',11,'2024-06-07 17:23:15.272','2024-06-07 17:23:15.272');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(338,'Razón Social',11,'2024-06-07 17:23:31.653','2024-06-07 17:23:31.653');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(339,'Número de Control',12,'2024-06-07 17:24:23.621','2024-06-07 17:24:23.621');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(340,'Número de Documento',12,'2024-06-07 17:24:32.335','2024-06-07 17:24:32.335');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(341,'Tipo de Documento',12,'2024-06-07 17:27:43.318','2024-06-07 17:27:43.318');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(342,'Fecha Emisión/Asignación',12,'2024-06-07 17:27:52.969','2024-06-07 17:27:52.969');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(343,'Número de RIF/CI',12,'2024-06-07 17:28:03.698','2024-06-07 17:28:03.698');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(344,'Razón Social',12,'2024-06-07 17:28:24.983','2024-06-07 17:28:24.983');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(345,'Número de Control',13,'2024-06-07 17:30:37.888','2024-06-07 17:30:37.888');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(346,'Número de Documento',13,'2024-06-07 17:30:45.601','2024-06-07 17:30:45.602');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(347,'Tipo de Documento',13,'2024-06-07 17:30:59.718','2024-06-07 17:30:59.718');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(348,'Fecha Emisión/Asignación',13,'2024-06-07 17:31:10.678','2024-06-07 17:31:10.678');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(349,'Número de RIF/CI',13,'2024-06-07 17:31:31.258','2024-06-07 17:31:31.258');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(350,'Razón Social',13,'2024-06-07 17:32:05.924','2024-06-07 17:32:05.924');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(351,'Número de Control',14,'2024-06-07 17:34:26.756','2024-06-07 17:34:26.756');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(352,'Número de Documento',14,'2024-06-07 17:34:35.135','2024-06-07 17:34:35.135');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(353,'Tipo de Documento',14,'2024-06-07 17:34:50.177','2024-06-07 17:34:50.177');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(354,'Fecha Emisión/Asignación',14,'2024-06-07 17:35:10.839','2024-06-07 17:35:10.839');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(355,'Número de RIF/CI',14,'2024-06-07 17:35:24.047','2024-06-07 17:35:24.047');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(356,'Razón Social',14,'2024-06-07 17:35:35.381','2024-06-07 17:35:35.381');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(357,'Número de Control',15,'2024-06-07 17:36:25.030','2024-06-07 17:36:25.030');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(358,'Número de Documento',15,'2024-06-07 17:36:36.385','2024-06-07 17:36:36.385');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(359,'Tipo de Documento',15,'2024-06-07 17:36:47.314','2024-06-07 17:36:47.314');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(360,'Fecha Emisión/Asignación',15,'2024-06-07 17:36:57.536','2024-06-07 17:36:57.536');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(361,'Número de RIF/CI',15,'2024-06-07 17:37:06.277','2024-06-07 17:37:06.277');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(362,'Razón Social',15,'2024-06-07 17:37:15.797','2024-06-07 17:37:15.797');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(363,'Número de Control',16,'2024-06-07 17:38:04.290','2024-06-07 17:38:04.290');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(364,'Número de Documento',16,'2024-06-07 17:38:15.374','2024-06-07 17:38:15.374');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(365,'Tipo de Documento',16,'2024-06-07 17:38:27.022','2024-06-07 17:38:27.022');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(366,'Fecha Emisión/Asignación',16,'2024-06-07 17:38:41.970','2024-06-07 17:38:41.970');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(367,'Número de RIF/CI',16,'2024-06-07 17:39:03.865','2024-06-07 17:39:03.865');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(368,'Razón Social',16,'2024-06-07 17:39:21.695','2024-06-07 17:39:21.695');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(369,'Número de Control',17,'2024-06-07 17:40:36.524','2024-06-07 17:40:36.524');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(370,'Número de Documento',17,'2024-06-07 17:40:43.059','2024-06-07 17:40:43.059');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(371,'Tipo de Documento',17,'2024-06-07 17:41:10.052','2024-06-07 17:41:10.052');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(372,'Fecha Emisión/Asignación',17,'2024-06-07 17:41:31.147','2024-06-07 17:41:31.147');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(373,'Número de RIF/CI',17,'2024-06-07 17:41:47.320','2024-06-07 17:41:47.320');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(374,'Razón Social',17,'2024-06-07 17:42:18.332','2024-06-07 17:42:18.332');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(375,'Número de Control',18,'2024-06-07 17:43:28.760','2024-06-07 17:43:28.760');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(376,'Número de Documento',18,'2024-06-07 17:43:36.362','2024-06-07 17:43:36.362');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(378,'Tipo de Documento',18,'2024-06-07 17:44:05.424','2024-06-07 17:44:05.424');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(379,'Fecha Emisión/Asignación',18,'2024-06-07 17:44:15.144','2024-06-07 17:44:15.144');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(380,'Número de RIF/CI',18,'2024-06-07 17:44:34.447','2024-06-07 17:44:34.447');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(381,'Razón Social',18,'2024-06-07 17:44:57.200','2024-06-07 17:44:57.200');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(382,'Número de Control',19,'2024-06-07 17:45:25.394','2024-06-07 17:45:25.394');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(383,'Número de Documento',19,'2024-06-07 17:45:39.826','2024-06-07 17:45:39.826');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(384,'Tipo de Documento',19,'2024-06-07 17:46:01.544','2024-06-07 17:46:01.544');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(385,'Fecha Emisión/Asignación',19,'2024-06-07 17:46:06.967','2024-06-07 17:46:06.967');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(386,'Número de RIF/CI',19,'2024-06-07 17:46:17.076','2024-06-07 17:46:17.076');
INSERT INTO consultas ("id","nombre","cliente_id","created_at","updated_at") VALUES(387,'Razón Social',19,'2024-06-07 17:46:29.164','2024-06-07 17:46:29.164');

INSERT INTO parametros ("id","name","tipo_input","placeholder","column_reference_cliente","created_at","updated_at") VALUES(1,'numero_control','text','Número de Control','','2024-05-06 21:10:05.328','2024-05-06 21:10:05.328');
INSERT INTO parametros ("id","name","tipo_input","placeholder","column_reference_cliente","created_at","updated_at") VALUES(2,'numero_documento','text','Número de Documento','','2024-05-06 21:10:05.340','2024-05-06 21:10:05.340');
INSERT INTO parametros ("id","name","tipo_input","placeholder","column_reference_cliente","created_at","updated_at") VALUES(3,'tipo_documento','selected','Tipo de Documento','name_bd_column_tipo_documento_format','2024-05-06 21:10:05.340','2024-05-06 21:10:05.340');
INSERT INTO parametros ("id","name","tipo_input","placeholder","column_reference_cliente","created_at","updated_at") VALUES(6,'rif','text','Número de RIF/CI','','2024-05-06 21:10:05.340','2024-05-06 21:10:05.340');
INSERT INTO parametros ("id","name","tipo_input","placeholder","column_reference_cliente","created_at","updated_at") VALUES(7,'codigo_operacion','date','Código de Operación','','2024-05-06 21:10:05.340','2024-05-06 21:10:05.340');
INSERT INTO parametros ("id","name","tipo_input","placeholder","column_reference_cliente","created_at","updated_at") VALUES(8,'razon_social','text','Razón Social','','2024-05-06 21:10:05.340','2024-05-06 21:10:05.340');
INSERT INTO parametros ("id","name","tipo_input","placeholder","column_reference_cliente","created_at","updated_at") VALUES(9,'serie','selected','Serie','name_bd_column_serie_format','2024-05-06 21:10:05.340','2024-05-06 21:10:05.340');
INSERT INTO parametros ("id","name","tipo_input","placeholder","column_reference_cliente","created_at","updated_at") VALUES(10,'numero_suscriptor','text','Número de Suscriptor/Cliente','','2024-05-06 21:10:05.355','2024-05-06 21:10:05.355');
INSERT INTO parametros ("id","name","tipo_input","placeholder","column_reference_cliente","created_at","updated_at") VALUES(12,'fecha','date','Rango de Fechas','','2024-05-30 16:53:40.249','2024-05-30 16:53:40.249');


CREATE TABLE consultas_parametros (
	"id" INTEGER NOT NULL DEFAULT AUTOINCREMENT UNIQUE,
	"consulta_id" INTEGER NOT NULL,
	"parametro_id" INTEGER NOT NULL,
	"created_at" TIMESTAMP NULL DEFAULT CURRENT TIMESTAMP,
	"updated_at" TIMESTAMP NULL DEFAULT CURRENT TIMESTAMP,
	PRIMARY KEY ( "id" ASC )
) IN "system";


INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(58,17,2,'2024-05-07 13:29:18.255','2024-05-07 13:29:18.255');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(59,18,2,'2024-05-07 13:29:21.197','2024-05-07 13:29:21.197');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(60,19,2,'2024-05-07 13:29:26.699','2024-05-07 13:29:26.699');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(61,20,2,'2024-05-07 13:29:29.289','2024-05-07 13:29:29.289');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(62,21,2,'2024-05-07 13:29:32.112','2024-05-07 13:29:32.112');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(63,22,2,'2024-05-07 13:29:35.159','2024-05-07 13:29:35.159');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(64,23,2,'2024-05-07 13:29:39.529','2024-05-07 13:29:39.529');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(65,24,2,'2024-05-07 13:29:43.696','2024-05-07 13:29:43.696');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(66,25,2,'2024-05-07 13:29:46.816','2024-05-07 13:29:46.816');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(67,26,2,'2024-05-07 13:29:51.308','2024-05-07 13:29:51.308');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(68,27,2,'2024-05-07 13:29:55.094','2024-05-07 13:29:55.094');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(69,28,2,'2024-05-07 13:29:58.548','2024-05-07 13:29:58.548');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(70,29,2,'2024-05-07 13:30:02.708','2024-05-07 13:30:02.708');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(582,241,1,'2024-06-03 14:35:42.847','2024-06-03 14:35:42.847');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(618,261,1,'2024-06-06 13:32:08.166','2024-06-06 13:32:08.166');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(619,262,2,'2024-06-06 13:32:19.775','2024-06-06 13:32:19.775');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(627,268,3,'2024-06-06 13:36:47.071','2024-06-06 13:36:47.071');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(628,268,12,'2024-06-06 13:36:47.071','2024-06-06 13:36:47.071');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(629,269,12,'2024-06-06 13:37:16.919','2024-06-06 13:37:16.919');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(630,270,6,'2024-06-06 13:37:30.820','2024-06-06 13:37:30.820');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(631,270,12,'2024-06-06 13:37:30.823','2024-06-06 13:37:30.823');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(632,271,8,'2024-06-06 13:37:46.232','2024-06-06 13:37:46.232');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(609,255,1,'2024-06-06 13:19:53.288','2024-06-06 13:19:53.288');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(610,256,2,'2024-06-06 13:20:11.062','2024-06-06 13:20:11.062');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(611,257,3,'2024-06-06 13:20:31.711','2024-06-06 13:20:31.711');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(612,257,12,'2024-06-06 13:20:31.712','2024-06-06 13:20:31.712');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(613,258,12,'2024-06-06 13:20:50.208','2024-06-06 13:20:50.208');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(614,259,6,'2024-06-06 13:21:04.172','2024-06-06 13:21:04.172');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(615,259,12,'2024-06-06 13:21:04.172','2024-06-06 13:21:04.172');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(616,260,8,'2024-06-06 13:21:30.891','2024-06-06 13:21:30.891');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(617,260,12,'2024-06-06 13:21:30.892','2024-06-06 13:21:30.892');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(633,271,12,'2024-06-06 13:37:46.232','2024-06-06 13:37:46.232');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(634,272,10,'2024-06-06 13:38:31.013','2024-06-06 13:38:31.013');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(644,279,1,'2024-06-07 16:55:09.895','2024-06-07 16:55:09.895');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(645,280,2,'2024-06-07 16:55:20.598','2024-06-07 16:55:20.598');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(646,281,3,'2024-06-07 16:55:34.100','2024-06-07 16:55:34.100');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(647,281,12,'2024-06-07 16:55:34.100','2024-06-07 16:55:34.100');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(648,282,12,'2024-06-07 16:55:46.789','2024-06-07 16:55:46.789');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(649,283,6,'2024-06-07 16:56:02.900','2024-06-07 16:56:02.900');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(650,283,12,'2024-06-07 16:56:02.901','2024-06-07 16:56:02.901');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(651,284,8,'2024-06-07 16:56:16.415','2024-06-07 16:56:16.415');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(652,284,12,'2024-06-07 16:56:16.416','2024-06-07 16:56:16.416');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(653,285,1,'2024-06-07 16:58:35.364','2024-06-07 16:58:35.364');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(654,286,2,'2024-06-07 16:58:51.903','2024-06-07 16:58:51.903');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(655,287,3,'2024-06-07 16:59:11.151','2024-06-07 16:59:11.151');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(656,287,12,'2024-06-07 16:59:11.152','2024-06-07 16:59:11.152');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(657,288,12,'2024-06-07 16:59:25.183','2024-06-07 16:59:25.183');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(660,290,1,'2024-06-07 17:00:29.527','2024-06-07 17:00:29.527');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(661,291,2,'2024-06-07 17:00:40.672','2024-06-07 17:00:40.672');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(662,292,3,'2024-06-07 17:01:07.305','2024-06-07 17:01:07.305');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(663,292,12,'2024-06-07 17:01:07.306','2024-06-07 17:01:07.306');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(664,293,12,'2024-06-07 17:01:19.377','2024-06-07 17:01:19.377');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(669,296,6,'2024-06-07 17:02:16.017','2024-06-07 17:02:16.017');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(670,296,12,'2024-06-07 17:02:16.018','2024-06-07 17:02:16.018');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(671,297,8,'2024-06-07 17:02:29.200','2024-06-07 17:02:29.200');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(672,297,12,'2024-06-07 17:02:29.200','2024-06-07 17:02:29.200');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(673,298,6,'2024-06-07 17:03:03.601','2024-06-07 17:03:03.602');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(674,298,12,'2024-06-07 17:03:03.603','2024-06-07 17:03:03.603');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(675,299,8,'2024-06-07 17:03:16.132','2024-06-07 17:03:16.132');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(676,299,12,'2024-06-07 17:03:16.133','2024-06-07 17:03:16.133');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(677,300,1,'2024-06-07 17:04:43.639','2024-06-07 17:04:43.639');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(678,301,2,'2024-06-07 17:04:57.124','2024-06-07 17:04:57.124');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(679,302,3,'2024-06-07 17:05:53.442','2024-06-07 17:05:53.442');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(680,302,12,'2024-06-07 17:05:53.443','2024-06-07 17:05:53.443');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(681,303,12,'2024-06-07 17:06:05.443','2024-06-07 17:06:05.443');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(682,304,6,'2024-06-07 17:06:18.920','2024-06-07 17:06:18.920');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(683,304,12,'2024-06-07 17:06:18.921','2024-06-07 17:06:18.921');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(684,305,8,'2024-06-07 17:06:32.033','2024-06-07 17:06:32.033');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(685,305,12,'2024-06-07 17:06:32.034','2024-06-07 17:06:32.034');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(686,306,1,'2024-06-07 17:09:03.863','2024-06-07 17:09:03.863');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(687,307,2,'2024-06-07 17:11:37.391','2024-06-07 17:11:37.391');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(688,308,3,'2024-06-07 17:12:00.742','2024-06-07 17:12:00.742');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(689,308,12,'2024-06-07 17:12:00.743','2024-06-07 17:12:00.743');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(692,310,12,'2024-06-07 17:12:34.391','2024-06-07 17:12:34.391');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(693,311,6,'2024-06-07 17:12:56.285','2024-06-07 17:12:56.285');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(694,311,12,'2024-06-07 17:12:56.286','2024-06-07 17:12:56.286');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(695,312,8,'2024-06-07 17:13:10.017','2024-06-07 17:13:10.017');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(696,312,12,'2024-06-07 17:13:10.018','2024-06-07 17:13:10.018');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(697,313,1,'2024-06-07 17:13:53.880','2024-06-07 17:13:53.880');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(698,314,2,'2024-06-07 17:14:10.162','2024-06-07 17:14:10.162');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(699,315,3,'2024-06-07 17:14:48.930','2024-06-07 17:14:48.930');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(700,315,12,'2024-06-07 17:14:48.934','2024-06-07 17:14:48.934');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(701,316,12,'2024-06-07 17:14:58.715','2024-06-07 17:14:58.715');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(704,318,6,'2024-06-07 17:15:31.488','2024-06-07 17:15:31.488');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(705,318,12,'2024-06-07 17:15:31.489','2024-06-07 17:15:31.489');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(706,319,8,'2024-06-07 17:15:43.158','2024-06-07 17:15:43.158');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(707,319,12,'2024-06-07 17:15:43.159','2024-06-07 17:15:43.159');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(708,320,1,'2024-06-07 17:16:41.617','2024-06-07 17:16:41.617');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(709,321,2,'2024-06-07 17:16:54.056','2024-06-07 17:16:54.056');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(711,323,3,'2024-06-07 17:17:19.622','2024-06-07 17:17:19.622');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(712,323,12,'2024-06-07 17:17:19.624','2024-06-07 17:17:19.624');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(713,324,12,'2024-06-07 17:17:28.303','2024-06-07 17:17:28.303');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(714,325,6,'2024-06-07 17:17:45.007','2024-06-07 17:17:45.007');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(715,325,12,'2024-06-07 17:17:45.007','2024-06-07 17:17:45.007');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(716,326,8,'2024-06-07 17:18:03.754','2024-06-07 17:18:03.754');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(717,326,12,'2024-06-07 17:18:03.754','2024-06-07 17:18:03.754');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(718,327,1,'2024-06-07 17:20:41.677','2024-06-07 17:20:41.677');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(719,328,2,'2024-06-07 17:20:50.265','2024-06-07 17:20:50.265');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(720,329,3,'2024-06-07 17:21:02.521','2024-06-07 17:21:02.521');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(721,329,12,'2024-06-07 17:21:02.521','2024-06-07 17:21:02.521');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(722,330,12,'2024-06-07 17:21:10.646','2024-06-07 17:21:10.646');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(723,331,6,'2024-06-07 17:21:21.300','2024-06-07 17:21:21.300');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(724,331,12,'2024-06-07 17:21:21.301','2024-06-07 17:21:21.301');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(725,332,8,'2024-06-07 17:21:41.063','2024-06-07 17:21:41.063');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(726,332,12,'2024-06-07 17:21:41.064','2024-06-07 17:21:41.064');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(727,333,1,'2024-06-07 17:22:22.664','2024-06-07 17:22:22.664');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(728,334,2,'2024-06-07 17:22:32.208','2024-06-07 17:22:32.208');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(729,335,3,'2024-06-07 17:22:40.215','2024-06-07 17:22:40.215');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(730,335,12,'2024-06-07 17:22:40.215','2024-06-07 17:22:40.215');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(731,336,12,'2024-06-07 17:23:00.064','2024-06-07 17:23:00.064');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(732,337,6,'2024-06-07 17:23:15.274','2024-06-07 17:23:15.274');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(733,337,12,'2024-06-07 17:23:15.274','2024-06-07 17:23:15.274');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(734,338,8,'2024-06-07 17:23:31.655','2024-06-07 17:23:31.655');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(735,338,12,'2024-06-07 17:23:31.656','2024-06-07 17:23:31.656');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(736,339,1,'2024-06-07 17:24:23.625','2024-06-07 17:24:23.625');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(737,340,2,'2024-06-07 17:24:32.336','2024-06-07 17:24:32.336');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(738,341,3,'2024-06-07 17:27:43.320','2024-06-07 17:27:43.320');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(739,341,12,'2024-06-07 17:27:43.321','2024-06-07 17:27:43.321');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(740,342,12,'2024-06-07 17:27:52.971','2024-06-07 17:27:52.971');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(741,343,6,'2024-06-07 17:28:03.700','2024-06-07 17:28:03.700');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(742,343,12,'2024-06-07 17:28:03.701','2024-06-07 17:28:03.701');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(743,344,8,'2024-06-07 17:28:24.985','2024-06-07 17:28:24.985');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(744,344,12,'2024-06-07 17:28:24.986','2024-06-07 17:28:24.986');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(745,345,1,'2024-06-07 17:30:37.890','2024-06-07 17:30:37.890');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(746,346,2,'2024-06-07 17:30:45.602','2024-06-07 17:30:45.602');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(747,347,3,'2024-06-07 17:30:59.720','2024-06-07 17:30:59.720');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(748,347,12,'2024-06-07 17:30:59.721','2024-06-07 17:30:59.721');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(749,348,12,'2024-06-07 17:31:10.680','2024-06-07 17:31:10.680');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(750,349,6,'2024-06-07 17:31:31.259','2024-06-07 17:31:31.259');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(751,349,12,'2024-06-07 17:31:31.260','2024-06-07 17:31:31.260');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(752,350,8,'2024-06-07 17:32:05.926','2024-06-07 17:32:05.926');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(753,350,12,'2024-06-07 17:32:05.926','2024-06-07 17:32:05.926');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(754,351,1,'2024-06-07 17:34:26.757','2024-06-07 17:34:26.757');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(755,352,2,'2024-06-07 17:34:35.137','2024-06-07 17:34:35.137');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(756,353,3,'2024-06-07 17:34:50.179','2024-06-07 17:34:50.179');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(757,353,12,'2024-06-07 17:34:50.181','2024-06-07 17:34:50.181');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(758,354,12,'2024-06-07 17:35:10.840','2024-06-07 17:35:10.840');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(759,355,6,'2024-06-07 17:35:24.049','2024-06-07 17:35:24.049');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(760,355,12,'2024-06-07 17:35:24.050','2024-06-07 17:35:24.050');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(761,356,8,'2024-06-07 17:35:35.382','2024-06-07 17:35:35.382');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(762,356,12,'2024-06-07 17:35:35.383','2024-06-07 17:35:35.383');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(763,357,1,'2024-06-07 17:36:25.031','2024-06-07 17:36:25.031');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(764,358,2,'2024-06-07 17:36:36.386','2024-06-07 17:36:36.386');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(765,359,3,'2024-06-07 17:36:47.315','2024-06-07 17:36:47.315');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(766,359,12,'2024-06-07 17:36:47.315','2024-06-07 17:36:47.315');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(767,360,12,'2024-06-07 17:36:57.540','2024-06-07 17:36:57.541');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(768,361,6,'2024-06-07 17:37:06.278','2024-06-07 17:37:06.278');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(769,361,12,'2024-06-07 17:37:06.279','2024-06-07 17:37:06.279');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(770,362,8,'2024-06-07 17:37:15.799','2024-06-07 17:37:15.799');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(771,362,12,'2024-06-07 17:37:15.800','2024-06-07 17:37:15.800');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(772,363,1,'2024-06-07 17:38:04.292','2024-06-07 17:38:04.292');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(773,364,2,'2024-06-07 17:38:15.375','2024-06-07 17:38:15.375');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(774,365,3,'2024-06-07 17:38:27.023','2024-06-07 17:38:27.023');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(775,365,12,'2024-06-07 17:38:27.024','2024-06-07 17:38:27.024');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(776,366,12,'2024-06-07 17:38:41.972','2024-06-07 17:38:41.972');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(777,367,6,'2024-06-07 17:39:03.866','2024-06-07 17:39:03.866');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(778,367,12,'2024-06-07 17:39:03.867','2024-06-07 17:39:03.867');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(779,368,8,'2024-06-07 17:39:21.697','2024-06-07 17:39:21.697');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(780,368,12,'2024-06-07 17:39:21.698','2024-06-07 17:39:21.698');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(781,369,1,'2024-06-07 17:40:36.525','2024-06-07 17:40:36.525');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(782,370,2,'2024-06-07 17:40:43.060','2024-06-07 17:40:43.060');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(783,371,3,'2024-06-07 17:41:10.054','2024-06-07 17:41:10.054');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(784,371,12,'2024-06-07 17:41:10.054','2024-06-07 17:41:10.054');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(785,372,12,'2024-06-07 17:41:31.150','2024-06-07 17:41:31.150');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(786,373,6,'2024-06-07 17:41:47.321','2024-06-07 17:41:47.321');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(787,373,12,'2024-06-07 17:41:47.323','2024-06-07 17:41:47.323');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(788,374,8,'2024-06-07 17:42:18.333','2024-06-07 17:42:18.333');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(789,374,12,'2024-06-07 17:42:18.334','2024-06-07 17:42:18.334');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(790,375,1,'2024-06-07 17:43:28.761','2024-06-07 17:43:28.761');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(791,376,2,'2024-06-07 17:43:36.364','2024-06-07 17:43:36.364');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(793,378,3,'2024-06-07 17:44:05.426','2024-06-07 17:44:05.426');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(794,378,12,'2024-06-07 17:44:05.427','2024-06-07 17:44:05.427');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(795,379,12,'2024-06-07 17:44:15.145','2024-06-07 17:44:15.145');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(796,380,6,'2024-06-07 17:44:34.448','2024-06-07 17:44:34.448');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(797,380,12,'2024-06-07 17:44:34.449','2024-06-07 17:44:34.449');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(798,381,8,'2024-06-07 17:44:57.201','2024-06-07 17:44:57.201');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(799,381,12,'2024-06-07 17:44:57.201','2024-06-07 17:44:57.201');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(800,382,1,'2024-06-07 17:45:25.396','2024-06-07 17:45:25.396');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(801,383,2,'2024-06-07 17:45:39.828','2024-06-07 17:45:39.828');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(802,384,3,'2024-06-07 17:46:01.546','2024-06-07 17:46:01.546');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(803,384,12,'2024-06-07 17:46:01.546','2024-06-07 17:46:01.546');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(804,385,12,'2024-06-07 17:46:06.969','2024-06-07 17:46:06.969');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(805,386,6,'2024-06-07 17:46:17.079','2024-06-07 17:46:17.079');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(806,386,12,'2024-06-07 17:46:17.081','2024-06-07 17:46:17.081');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(807,387,8,'2024-06-07 17:46:29.168','2024-06-07 17:46:29.168');
INSERT INTO consultas_parametros ("id","consulta_id","parametro_id","created_at","updated_at") VALUES(808,387,12,'2024-06-07 17:46:29.170','2024-06-07 17:46:29.170');

CREATE TABLE consultas_roles (
	"id" INTEGER NOT NULL DEFAULT AUTOINCREMENT,
	"rol_id" INTEGER NOT NULL,
	"consulta_id" INTEGER NOT NULL,
	PRIMARY KEY ( "id" ASC )
) IN "system";

INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(35,1,261);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(36,2,261);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(37,3,261);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(38,4,261);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(39,1,262);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(40,2,262);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(41,3,262);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(42,4,262);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(11,1,255);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(12,2,255);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(13,3,255);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(14,4,255);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(15,1,256);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(16,2,256);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(17,3,256);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(18,4,256);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(19,1,257);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(20,2,257);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(21,3,257);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(22,4,257);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(23,1,258);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(24,2,258);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(25,3,258);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(26,4,258);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(27,1,259);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(28,2,259);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(29,3,259);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(30,4,259);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(31,1,260);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(32,2,260);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(33,3,260);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(34,4,260);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(62,1,268);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(63,2,268);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(64,3,268);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(65,4,268);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(66,1,269);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(67,2,269);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(68,3,269);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(69,4,269);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(70,1,270);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(71,2,270);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(72,3,270);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(73,4,270);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(74,1,271);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(75,2,271);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(76,3,271);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(77,4,271);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(78,1,272);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(79,3,272);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(80,4,272);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(99,1,279);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(100,2,279);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(101,3,279);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(102,4,279);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(103,1,280);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(104,2,280);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(105,3,280);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(106,4,280);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(107,1,281);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(108,2,281);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(109,3,281);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(110,4,281);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(111,1,282);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(112,2,282);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(113,3,282);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(114,4,282);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(115,1,283);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(116,2,283);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(117,3,283);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(118,4,283);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(119,1,284);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(120,2,284);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(121,3,284);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(122,4,284);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(123,1,285);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(124,2,285);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(125,3,285);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(126,4,285);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(127,1,286);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(128,2,286);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(129,3,286);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(130,4,286);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(131,1,287);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(132,2,287);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(133,3,287);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(134,4,287);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(135,1,288);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(136,2,288);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(137,3,288);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(138,4,288);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(143,1,290);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(144,2,290);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(145,3,290);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(146,4,290);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(147,1,291);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(148,2,291);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(149,3,291);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(150,4,291);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(151,1,292);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(152,2,292);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(153,3,292);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(154,4,292);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(155,1,293);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(156,2,293);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(157,3,293);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(158,4,293);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(159,1,296);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(160,2,296);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(161,3,296);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(162,4,296);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(163,1,297);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(164,2,297);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(165,3,297);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(166,4,297);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(167,1,298);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(168,2,298);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(169,3,298);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(170,4,298);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(171,1,299);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(172,2,299);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(173,3,299);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(174,4,299);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(175,1,300);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(176,2,300);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(177,3,300);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(178,4,300);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(179,1,301);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(180,2,301);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(181,3,301);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(182,4,301);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(183,1,302);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(184,2,302);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(185,3,302);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(186,4,302);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(187,1,303);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(188,2,303);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(189,3,303);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(190,4,303);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(191,1,304);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(192,2,304);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(193,3,304);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(194,4,304);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(195,1,305);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(196,2,305);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(197,3,305);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(198,4,305);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(199,1,306);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(200,2,306);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(201,3,306);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(202,4,306);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(203,1,307);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(204,2,307);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(205,3,307);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(206,4,307);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(207,1,308);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(208,2,308);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(209,3,308);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(210,4,308);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(215,1,310);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(216,2,310);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(217,3,310);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(218,4,310);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(219,1,311);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(220,2,311);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(221,3,311);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(222,4,311);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(223,1,312);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(224,2,312);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(225,3,312);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(226,4,312);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(227,1,313);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(228,2,313);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(229,3,313);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(230,4,313);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(231,1,314);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(232,2,314);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(233,3,314);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(234,4,314);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(235,1,315);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(236,2,315);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(237,3,315);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(238,4,315);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(239,1,316);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(240,2,316);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(241,3,316);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(242,4,316);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(247,1,318);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(248,2,318);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(249,3,318);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(250,4,318);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(251,1,319);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(252,2,319);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(253,3,319);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(254,4,319);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(255,1,320);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(256,2,320);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(487,1,378);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(488,2,378);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(489,3,378);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(490,4,378);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(491,1,379);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(492,2,379);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(493,3,379);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(494,4,379);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(495,1,380);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(496,2,380);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(497,3,380);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(498,4,380);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(499,1,381);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(500,2,381);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(501,3,381);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(502,4,381);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(503,1,382);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(504,2,382);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(505,3,382);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(506,4,382);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(507,1,383);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(508,2,383);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(509,3,383);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(510,4,383);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(511,1,384);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(512,2,384);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(513,3,384);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(514,4,384);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(515,1,385);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(516,2,385);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(517,3,385);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(518,4,385);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(519,1,386);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(520,2,386);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(521,3,386);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(522,4,386);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(523,1,387);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(524,2,387);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(525,3,387);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(526,4,387);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(257,3,320);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(258,4,320);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(259,1,321);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(260,2,321);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(261,3,321);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(262,4,321);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(267,1,323);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(268,2,323);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(269,3,323);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(270,4,323);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(271,1,324);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(272,2,324);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(273,3,324);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(274,4,324);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(275,1,325);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(276,2,325);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(277,3,325);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(278,4,325);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(279,1,326);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(280,2,326);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(281,3,326);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(282,4,326);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(283,1,327);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(284,2,327);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(285,3,327);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(286,4,327);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(287,1,328);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(288,2,328);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(289,3,328);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(290,4,328);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(291,1,329);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(292,2,329);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(293,3,329);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(294,4,329);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(295,1,330);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(296,2,330);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(297,3,330);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(298,4,330);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(299,1,331);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(300,2,331);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(301,3,331);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(302,4,331);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(303,1,332);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(304,2,332);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(305,3,332);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(306,4,332);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(307,1,333);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(308,2,333);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(309,3,333);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(310,4,333);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(311,1,334);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(312,2,334);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(313,3,334);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(314,4,334);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(315,1,335);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(316,2,335);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(317,3,335);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(318,4,335);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(319,1,336);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(320,2,336);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(321,3,336);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(322,4,336);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(323,1,337);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(324,2,337);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(325,3,337);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(326,4,337);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(327,1,338);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(328,2,338);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(329,3,338);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(330,4,338);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(331,1,339);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(332,2,339);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(333,3,339);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(334,4,339);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(335,1,340);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(336,2,340);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(337,3,340);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(338,4,340);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(339,1,341);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(340,2,341);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(341,3,341);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(342,4,341);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(343,1,342);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(344,2,342);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(345,3,342);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(346,4,342);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(347,1,343);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(348,2,343);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(349,3,343);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(350,4,343);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(351,1,344);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(352,2,344);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(353,3,344);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(354,4,344);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(355,1,345);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(356,2,345);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(357,3,345);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(358,4,345);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(359,1,346);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(360,2,346);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(361,3,346);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(362,4,346);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(363,1,347);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(364,2,347);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(365,3,347);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(366,4,347);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(367,1,348);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(368,2,348);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(369,3,348);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(370,4,348);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(371,1,349);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(372,2,349);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(373,3,349);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(374,4,349);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(375,1,350);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(376,2,350);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(377,3,350);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(378,4,350);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(379,1,351);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(380,2,351);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(381,3,351);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(382,4,351);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(383,1,352);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(384,2,352);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(385,3,352);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(386,4,352);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(387,1,353);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(388,2,353);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(389,3,353);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(390,4,353);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(391,1,354);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(392,2,354);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(393,3,354);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(394,4,354);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(395,1,355);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(396,2,355);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(397,3,355);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(398,4,355);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(399,1,356);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(400,2,356);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(401,3,356);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(402,4,356);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(403,1,357);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(404,2,357);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(405,3,357);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(406,4,357);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(407,1,358);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(408,2,358);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(409,3,358);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(410,4,358);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(411,1,359);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(412,2,359);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(413,3,359);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(414,4,359);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(415,1,360);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(416,2,360);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(417,3,360);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(418,4,360);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(419,1,361);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(420,2,361);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(421,3,361);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(422,4,361);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(423,1,362);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(424,2,362);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(425,3,362);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(426,4,362);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(427,1,363);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(428,2,363);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(429,3,363);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(430,4,363);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(431,1,364);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(432,2,364);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(433,3,364);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(434,4,364);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(435,1,365);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(436,2,365);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(437,3,365);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(438,4,365);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(439,1,366);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(440,2,366);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(441,3,366);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(442,4,366);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(443,1,367);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(444,2,367);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(445,3,367);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(446,4,367);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(447,1,368);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(448,2,368);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(449,3,368);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(450,4,368);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(451,1,369);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(452,2,369);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(453,3,369);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(454,4,369);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(455,1,370);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(456,2,370);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(457,3,370);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(458,4,370);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(459,1,371);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(460,2,371);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(461,3,371);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(462,4,371);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(463,1,372);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(464,2,372);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(465,3,372);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(466,4,372);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(467,1,373);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(468,2,373);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(469,3,373);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(470,4,373);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(471,1,374);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(472,2,374);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(473,3,374);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(474,4,374);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(475,1,375);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(476,2,375);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(477,3,375);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(478,4,375);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(479,1,376);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(480,2,376);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(481,3,376);
INSERT INTO consultas_roles ("id","rol_id","consulta_id") VALUES(482,4,376);

