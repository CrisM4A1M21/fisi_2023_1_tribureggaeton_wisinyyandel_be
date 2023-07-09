import {createPool} from 'mysql2/promise';

export const pool = createPool({
    user: 'root',
    password: 'M4A1M215.7',
    host: 'localhost',
    port: 3306,
    database: 'tienda_campesin'
});