import {Router} from 'express';
import {createVoucher, getVoucher} from '../controllers/vouchers.controllers.js';

const router = Router();

router.get('/mostrar-compras/:voucherId', getVoucher);
router.post('/guardar-compras', createVoucher);

export default router;