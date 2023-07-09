import axios from 'axios';

export const getProducts = async(req, res)=>{

    const url = "http://localhost:3000/ne-productos/servicio-al-cliente/v1/mostrar-productos";
    const url_f = "";

    axios.get(url).then(response=>{
        let productos = response.data;
        res.json(productos);

    });

     
}