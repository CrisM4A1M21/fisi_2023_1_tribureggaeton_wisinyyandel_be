create database tienda_campesin;
-- drop database tienda_campesin;
use tienda_campesin;
create table categoria(
	id_categoria int primary key auto_increment,
    nombre_categoria varchar(40)
);

create table producto(
	id_producto int primary key auto_increment,
    nombre varchar(100),
    precio_venta decimal(10, 2) default 0,
    stock int default 0,
    fecha_venc date not null,
    imagen varchar(200),
    id_categoria int,
    foreign key(id_categoria) references categoria(id_categoria)
);

create table metodopago(
	id_pago int primary key auto_increment,
    metodo varchar(50) not null
);

create table boleta(
	nro_boleta int primary key auto_increment,
    fecha date not null default (curdate()),
    nombre varchar(50) not null,
    total decimal(10,2),
    id_pago int not null,
	foreign key(id_pago) references metodopago(id_pago)
);

create table detalleboleta(
	nro_boleta int,
    id_producto int,
    cantidad int not null,
    precio decimal(10, 2) not null,
    submonto decimal(10, 2) not null,
    primary key (nro_boleta, id_producto),
    foreign key(nro_boleta) references boleta(nro_boleta),
    foreign key(id_producto) references producto(id_producto)
);

create table pedidos(
	nro_boleta int,
    nombre_cliente varchar(50) not null,
    telefono varchar(12) not null,
    delivery bit not null,
    fecha_entrega date not null,
    direccion varchar(200),
    monto_cliente decimal(10,2) default 0,
    primary key(nro_boleta),
    foreign key(nro_boleta) references boleta(nro_boleta)
);
    
-- Categorias
insert into categoria(`nombre_categoria`) values ('ABARROTES');
insert into categoria(`nombre_categoria`) values ('LACTEOS');
insert into categoria(`nombre_categoria`) values ('BEBIDAS');
insert into categoria(`nombre_categoria`) values ('CEREALES');
insert into categoria(`nombre_categoria`) values ('DETERGENTES');
insert into categoria(`nombre_categoria`) values ('CONSERVAS');

-- Productos
insert into producto(`nombre`, `precio_venta`, `stock`, `fecha_venc`, `id_categoria`)
	values('Arroz Campero 1kg', 4.20, 20, '2023-09-24', 1);
insert into producto(`nombre`, `precio_venta`, `stock`, `fecha_venc`, `id_categoria`)
	values('Azucar Rubia 1kg', 3.00, 20, '2023-09-24', 1);
insert into producto(`nombre`, `precio_venta`, `stock`, `fecha_venc`, `id_categoria`)
	values('Fideos Linguini DON VITTORIO Bolsa 450g', 4.70, 20, '2024-01-01', 1);
insert into producto(`nombre`, `precio_venta`, `stock`, `fecha_venc`, `id_categoria`)
	values('Yogurt Bebible GLORIA Sabor a Fresa Botella 1Kg', 6.80, 20, '2024-09-01', 2);
insert into producto(`nombre`, `precio_venta`, `stock`, `fecha_venc`, `id_categoria`)
	values('Leche Tarro Azul GLORIA GDE X 395 GR', 4.00, 20, '2024-01-01', 2);
insert into producto(`nombre`, `precio_venta`, `stock`, `fecha_venc`, `id_categoria`)
	values('Aceite Vegetal PRIMOR Clásico Botella 900ml', 11.60, 20, '2024-01-01', 1);
insert into producto(`nombre`, `precio_venta`, `stock`, `fecha_venc`, `id_categoria`)
	values('Gaseosa INCA KOLA Botella 500ml', 2.90, 20, '2024-06-01', 4);
insert into producto(`nombre`, `precio_venta`, `stock`, `fecha_venc`, `id_categoria`)
	values('Gaseosa COCA COLA Botella 500ml', 2.90, 20, '2024-06-01', 3);
insert into producto(`nombre`, `precio_venta`, `stock`, `fecha_venc`, `id_categoria`)
	values('Cerveza PILSEN Lata 473ml Paquete 6un', 27.90, 20, '2024-01-01', 3);
insert into producto(`nombre`, `precio_venta`, `stock`, `fecha_venc`, `id_categoria`)
	values('Cerveza CORONA Extra Botella 355ml 6 Pack', 29.90, 20, '2024-01-01', 3);
insert into producto(`nombre`, `precio_venta`, `stock`, `fecha_venc`, `id_categoria`)
	values('Avena QUAKER Tradicional Bolsa 900g', 14.50, 20, '2024-01-01', 1);
insert into producto(`nombre`, `precio_venta`, `stock`, `fecha_venc`, `id_categoria`)
	values('Avena Clásica 3 OSITOS Premium Bolsa 900g', 12.90, 20, '2024-01-01', 1);
insert into producto(`nombre`, `precio_venta`, `stock`, `fecha_venc`, `id_categoria`)
	values('Cereal ÁNGEL Zuck Bolsa 130g', 3.30, 20, '2024-01-01', 4);
insert into producto(`nombre`, `precio_venta`, `stock`, `fecha_venc`, `id_categoria`)
	values('Detergente en Polvo BOLÍVAR Active Care Bolsa 750g', 11.80, 20, '2024-01-01', 5);
insert into producto(`nombre`, `precio_venta`, `stock`, `fecha_venc`, `id_categoria`)
	values('Detergente en Polvo ACE Aroma Floral Bolsa 750g', 12.90, 20, '2024-01-01', 5);
insert into producto(`nombre`, `precio_venta`, `stock`, `fecha_venc`, `id_categoria`)
	values('Detergente en Polvo ARIEL Cuidado para Lavar Ropa Blanca y de Color 750g', 13.90, 20, '2024-01-01', 5);
insert into producto(`nombre`, `precio_venta`, `stock`, `fecha_venc`, `id_categoria`)
	values('Duraznos en Almíbar ARICA Lata 820g', 9.90, 20, '2026-01-01', 6);
insert into producto(`nombre`, `precio_venta`, `stock`, `fecha_venc`, `id_categoria`)
	values('Trozos de Atún en Aceite Vegetal CAMPOMAR Lata 150g', 6.10, 20, '2026-01-01', 6);
insert into producto(`nombre`, `precio_venta`, `stock`, `fecha_venc`, `id_categoria`)
	values('Filete de Atún en Aceite Vegetal FLORIDA Lata 140g', 6.40, 20, '2025-01-01', 6);
    
-- Metodo de pago
insert into metodopago(`metodo`) values('Pago en efectivo');
insert into metodopago(`metodo`) values('Yape');

--  Boleta
insert into boleta(`fecha`, `nombre`, `total`, `id_pago`)
	values('2023-07-02', 'Maria Nuñez Pinedo', 34.80, 2);
insert into boleta(`fecha`, `nombre`, `total`, `id_pago`)
	values('2023-07-02', 'Franco Varillas Muñoz', 12.7, 2);
insert into boleta(`fecha`, `nombre`, `total`, `id_pago`)
	values('2023-07-03', 'Jairo Ortiz Cadillo', 6.80, 2);
insert into boleta(`fecha`, `nombre`, `total`, `id_pago`)
	values('2023-07-03', 'Rodrigo Ortiz Santos', 7.20, 2);
insert into boleta(`fecha`, `nombre`, `total`, `id_pago`)
	values('2023-07-03', 'Pamela Diaz Blacido', 17.90, 1);
insert into boleta(`fecha`, `nombre`, `total`, `id_pago`)
	values('2023-07-04', 'Leticia Villa Herrera', 13.90, 2);
insert into boleta(`fecha`, `nombre`, `total`, `id_pago`)
	values('2023-07-04', 'Frank Vera Aria', 5.80, 2);
    
-- Detalle Boleta
insert into detalleboleta(`nro_boleta`, `id_producto`, `cantidad`, `precio`, `submonto`)
	values(1, 6, 3, 11.60, 34.80);
insert into detalleboleta(`nro_boleta`, `id_producto`, `cantidad`, `precio`, `submonto`)
	values(2, 13, 2, 3.3, 6.60);
insert into detalleboleta(`nro_boleta`, `id_producto`, `cantidad`, `precio`, `submonto`)
	values(2, 18, 1, 6.1, 6.10);
insert into detalleboleta(`nro_boleta`, `id_producto`, `cantidad`, `precio`, `submonto`)
	values(3, 4, 1, 6.80, 6.80);
insert into detalleboleta(`nro_boleta`, `id_producto`, `cantidad`, `precio`, `submonto`)
	values(4, 1, 1, 4.20, 4.20);
insert into detalleboleta(`nro_boleta`, `id_producto`, `cantidad`, `precio`, `submonto`)
	values(4, 2, 1, 3.00, 3.00);
insert into detalleboleta(`nro_boleta`, `id_producto`, `cantidad`, `precio`, `submonto`)
	values(5, 5, 2, 4.00, 8.00);
insert into detalleboleta(`nro_boleta`, `id_producto`, `cantidad`, `precio`, `submonto`)
	values(5, 13, 3, 3.30, 9.90);
insert into detalleboleta(`nro_boleta`, `id_producto`, `cantidad`, `precio`, `submonto`)
	values(6, 16, 1, 13.90, 13.90);
insert into detalleboleta(`nro_boleta`, `id_producto`, `cantidad`, `precio`, `submonto`)
	values(7, 7, 1, 2.90, 2.90);
insert into detalleboleta(`nro_boleta`, `id_producto`, `cantidad`, `precio`, `submonto`)
	values(7, 8, 1, 2.90, 2.90);
    
-- Pedidos
insert into pedidos values(1, 'Maria Nuñez Pinedo', '985212014', 1, '2023-07-02', 'Calle los olivares 123', 0.00);
insert into pedidos values(2, 'Franco Varillas Muñoz', '985772014', 1, '2023-07-02', 'Calle los girasoles 345', 0.00);
insert into pedidos values(3, 'Jairo Ortiz Cadillo', '941212014', 1, '2023-07-03', 'Calle los angeles 789', 0.00);
insert into pedidos values(4, 'Rodrigo Ortiz Santos', '985212050', 1, '2023-07-03', 'Calle el milagro 410', 0.00);
insert into pedidos values(5, 'Pamela Diaz Blacido', '985212120', 0, '2023-07-03', '', 0.00);
insert into pedidos values(6, 'Leticia Villa Herrera', '985214891', 1, '2023-07-04', 'Calle angelica 483', 0.00);
insert into pedidos values(7, 'Frank Vera Aria', '985200325', 1, '2023-07-04', 'Calle leonor 203', 0.00);
    
select * from boleta;
select*from pedidos;
    
-- Retornar producto
select * from producto;

-- Guardar boleta
insert into boleta (nro_boleta, fecha, nombre, total, id_pago)
            values (8, '2023-07-08', 'Paola Verduz', 4.20, 2);
-- Guardar detalle_boleta
insert into detalleboleta(`nro_boleta`, `id_producto`, `cantidad`, `precio`, `submonto`)
	values(8, 1, 1, 4.20, 4.20);
-- Guardar pedido
insert into pedidos values(8, 'Paola Verduz', '985200300', 1, '2023-07-08', 'Calle leonor 2001', 0.00);