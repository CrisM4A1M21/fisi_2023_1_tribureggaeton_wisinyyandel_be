import axios from 'axios';

export const createVoucher = async (req, res) =>{

    const url = "http://localhost:3000/ne-gestion-compras/servicio-al-cliente/v1/guardar-compras";

    const { fecha, nombre, producto ,total, id_pago } = req.body;

    let boleta = {
        fecha: fecha,
        nombre: nombre,
        producto: producto,
        total: total,
        id_pago: id_pago
    }

    res.json(boleta);

    axios.post(url, boleta)
        .then(res=>{
            console.log('API-UX - Gestion de Boletas guardar');
            console.log(res.status);
        });
}

export const getVoucher = async (req, res)=>{
    const voucherId = req.params.voucherId;
    let url = "http://localhost:3000/ne-gestion-compras/servicio-al-cliente/v1/mostrar-compras/"+voucherId;

    axios.get(url).then(response=>{
        let boleta_cliente = response.data;
        res.json(boleta_cliente);

    });
}