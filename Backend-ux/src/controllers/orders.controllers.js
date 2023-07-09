import axios from 'axios';

export const createOrder = async (req, res)=>{

    const url = "http://localhost:3000/ne-gestion-pedidos/servicio-al-cliente/v1/guardar-pedidos";

    const {nro_boleta, nombre_cliente, telefono, delivery, fecha_entrega, direccion, monto_cliente} = req.body;

    let pedido = {
        nro_boleta: nro_boleta, 
        nombre_cliente: nombre_cliente, 
        telefono: telefono, 
        delivery: delivery,
        fecha_entrega: fecha_entrega,
        direccion: direccion,
        monto_cliente: monto_cliente
    }

    res.json(pedido);

    axios.post(url, pedido)
        .then(res=>{
            console.log('API-UX - Gestion de Pedidos guardar');
            console.log(res.status);
        });
}

