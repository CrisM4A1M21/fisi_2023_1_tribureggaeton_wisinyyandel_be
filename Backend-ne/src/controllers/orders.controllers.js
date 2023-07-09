import {pool} from '../database.js';

export const createOrder = async (req, res) =>{
    const { nro_boleta, nombre_cliente, telefono, delivery, fecha_entrega, direccion, monto_cliente } = req.body;
    
    try {
        const connection = await pool.getConnection();

        // Insertar el nuevo pedido en la tabla
        const [insertResult] = await connection.query(`
            INSERT INTO pedidos (nro_boleta, nombre_cliente, telefono, delivery, fecha_entrega, direccion, monto_cliente)
            VALUES (${nro_boleta}, '${nombre_cliente}', '${telefono}', ${delivery}, '${fecha_entrega}', '${direccion}', ${monto_cliente})
        `);

        connection.release();
        console.log('Pedido creado correctamente');
        res.json({nro_boleta: nro_boleta});
        
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Error al crear el pedido' });
    }
}