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