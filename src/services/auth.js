import { mySqlPool } from '#config/mySql.js';
import { querySql } from '#helpers/sql.js';

class AuthService {
    async login(email) {
        const sql = `CALL sp_getUserByEmail('${email}');`;
        return querySql(mySqlPool, sql, (fulfill, result) => fulfill(result));
    }

    async registration(email, login, name, password, telephone) {
        //const sql = `CALL sp_regUser('${email1}', '${login1}', '${name1}', '${password1}', '${telephone1}');`;
        const sql = `INSERT INTO \`tblUsers\` (\`onlineStatus\`, \`email\`, \`lastLogin\`, \`login\`, \`name\`, \`password\`,\`patronymic\`, \`surname\`, \`telephone\`)
             VALUES (0, '${email}',NOW(),'${login}','${name}','${password}','Побатькові', 'Прізвище','${telephone}');`;
        return querySql(mySqlPool, sql, (fulfill, result) => fulfill(result));
    }
}

export const authService = new AuthService();
