import {pool} from '../database.js';

export const getProducts = async(req, res)=>{

    try{
        const connection = await pool.getConnection();

        // Obtener todos los productos
        const [rows] = await connection.query('SELECT * FROM producto');

        connection.release();
        let productos = JSON.stringify(rows);
        productos = JSON.parse(productos);

        res.json(productos);
       
    }catch(error){
        console.log(error);
        res.status(500).json({error: 'Error al obtener los productos'});
    }
}