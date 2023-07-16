import express from 'express';
import cors from 'cors';
import morgan from 'morgan';
import productRoute from './routes/products.routes.js';
import voucherRoute from './routes/vouchers.routes.js';
import orderRoute from './routes/orders.routes.js';

const port = process.env.PORT || 4000;
const app = express();

app.use(morgan('dev'));
app.use(express.json());
app.use(cors());

app.use('/ux-productos/tc/servicio-al-cliente/v1', productRoute);
app.use('/ux-gestion-compras/tc/servicio-al-cliente/v1', voucherRoute);
app.use('/ux-gestion-datos-entregas/tc/servicio-al-cliente/v1', orderRoute);

app.use((req, res, next)=>{
    res.status(404).send('Esta pagina no existe');
});
app.listen(port, ()=>{
    console.log('API UX-');
})