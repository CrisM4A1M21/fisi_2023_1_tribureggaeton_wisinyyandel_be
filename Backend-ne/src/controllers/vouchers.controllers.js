import axios from 'axios';
import {pool} from '../database.js';

export const createVoucher = async (req, res) =>{

    const { fecha, nombre, producto ,total, id_pago } = req.body;

    try {
        const connection = await pool.getConnection();

        // Obtener el último ID incremental
        const [lastIdResult] = await connection.query('SELECT MAX(nro_boleta) AS lastId FROM boleta');
        const lastId = lastIdResult[0].lastId || 0;

        // Insertar el nueva boleta en la tabla
        await connection.query(`
            INSERT INTO boleta (nro_boleta, fecha, nombre, total, id_pago)
            VALUES (${lastId + 1}, '${fecha}', '${nombre}', ${total}, '${id_pago}')
        `);

       producto.forEach(async p => {
            await connection.query(`
            INSERT INTO detalleboleta (nro_boleta, id_producto, cantidad, precio, submonto)
            VALUES (${lastId + 1}, ${p.id_producto}, ${p.cantidad}, ${p.precio}, ${p.submonto})`);

            await connection.query(`update producto set stock = stock-${p.cantidad} where id_producto=${p.id_producto}`);
       });
    
       connection.release();
       const nro_boleta = lastId + 1
       console.log("Boleta: ", nro_boleta);
       res.json({nro_boleta: nro_boleta});


    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Error al crear la boleta' });
    }

}

export const getVoucher = async (req, res) =>{
    const id = req.params.voucherId;
    try {
        const connection = await pool.getConnection();

        const [rows] = await connection.query(`select b.nro_boleta, b.fecha, b.nombre, p.nombre producto, db.cantidad, db.submonto, b.total monto, mp.metodo, ped.delivery delivery from boleta as b `+
        `join detalleboleta as db on b.nro_boleta = db.nro_boleta `+
        `join producto as p on db.id_producto = p.id_producto `+
        `join categoria as c on p.id_categoria = c.id_categoria `+
        `join metodopago as mp on b.id_pago = mp.id_pago `+
        `join pedidos as ped on b.nro_boleta = ped.nro_boleta `+
        `where b.nro_boleta = ${id}`);

        connection.release();
        ///////////////////////////
        const json = JSON.stringify(rows);

        // Parsear el JSON a un arreglo
        const data = JSON.parse(json);

        // Juntar elementos por nro_boleta
        const mergedData = data.reduce((acc, curr) => {
        const foundItem = acc.find(item => item.nro_boleta === curr.nro_boleta);

        if (foundItem) {
            foundItem.producto.push({
            nombre: curr.producto,
            cantidad: curr.cantidad,
            submonto: curr.submonto
            });

        } else {
            acc.push({
            nro_boleta: curr.nro_boleta,
            fecha: curr.fecha,
            nombre: curr.nombre,
            producto: [{
                nombre: curr.producto,
                cantidad: curr.cantidad,
                submonto: curr.submonto
            }],
            monto: curr.monto,
            metodo: curr.metodo,
            delivery: curr.delivery.data[0]
            });
        }

        return acc;
        }, []);

        // Convertir el resultado a JSON
        const json1 = JSON.stringify(mergedData);
        const cleanedJson = JSON.parse(json1);

        res.json(cleanedJson)//res.json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Error al obtener los datos del producto' });
    }
}
