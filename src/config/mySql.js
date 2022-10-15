import mysql2 from 'mysql2';
import { readFileSync } from 'fs';
import { sep } from 'path';

const KEYS_FILE = 'keys.json';
const readCertFile = (file) =>
    readFileSync(`${process.cwd()}${sep}certs${sep}${file}`, 'utf8');

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
/*
// TODO I am rofling in the following code:
import { writeFileSync } from 'fs';

const writeCertFile = (file) =>
    writeFileSync(`${process.cwd()}${sep}certs${sep}${file}`, 'utf8');

// MySql pool.
export const mySqlPoolWrite = mysql2.createPool({
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
});*/
