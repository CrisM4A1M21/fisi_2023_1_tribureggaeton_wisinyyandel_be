import {Router} from 'express';
import {createVoucher, getVoucher} from '../controllers/vouchers.controllers.js';
//import router from './products.routes.js';
const router = Router();

router.get('/mostrar-compras/:voucherId', getVoucher);
router.post('/guardar-compras', createVoucher);

export default router;