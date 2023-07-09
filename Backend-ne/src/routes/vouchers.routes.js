import {Router} from 'express';
import {createVoucher, getVoucher} from '../controllers/vouchers.controllers.js';
//import router from './products.routes.js';
const router = Router();

router.get('/devolver-boletas/:voucherId', getVoucher);
router.post('/guardar-boletas', createVoucher);

export default router;