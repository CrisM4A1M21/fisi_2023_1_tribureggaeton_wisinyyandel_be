import {Router} from 'express';
import { getProducts } from '../controllers/products.controllers.js';

const router = Router();

router.get('/mostrar-productos', getProducts);

export default router;