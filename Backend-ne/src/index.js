import express from 'express';
import cors from 'cors';
import morgan from 'morgan';
import productRoute from './routes/products.routes.js';
import vouchersRoute from './routes/vouchers.routes.js';
import ordersRoute from './routes/orders.routes.js';

const port = process.env.PORT || 3000;
const app = express();

app.use(morgan('dev'));
app.use(express.json());
app.use(cors());

app.use('/ne-productos/servicio-al-cliente/v1', productRoute);
app.use('/ne-gestion-compras/servicio-al-cliente/v1', vouchersRoute);
app.use('/ne-gestion-datos-entregas/servicio-al-cliente/v1', ordersRoute);

app.use((req, res, next)=>{
    res.status(404).send('Esta pagina no existe');
});
app.listen(port, ()=>{
    console.log('API NE-');
});