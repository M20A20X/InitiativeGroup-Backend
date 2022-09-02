import mysql2 from 'mysql2';
import { readFileSync } from 'fs';
import { sep } from 'path';

const KEYS_FILE = 'keys.json';
const readCertFile = (file) =>
    readFileSync(`${process.env.PWD}${sep}certs${sep}${file}`, 'utf8');

const certsJson = JSON.parse(readCertFile(KEYS_FILE));

// MySql pool.
export const mySqlPool = mysql2.createPool({
    connectionLimit: 7,
    host: '34.118.106.53',
    user: 'root',
    ssl: {
        cert: readCertFile(certsJson.cert),
        key: readCertFile(certsJson.key),
        ca: readCertFile(certsJson.ca)
    },
    password: readCertFile(certsJson.password),
    database: 'ig'
});
