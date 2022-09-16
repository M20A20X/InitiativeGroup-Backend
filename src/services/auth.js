import { mySqlPool } from '../config/mySql.js';
import { querySql } from '../helpers/sql.js';

class AuthService {
    // (YOUR) custom service logic (of course, YOU can have different set of features).
    async get(login, password) {
        // Custom logic...
        const sql = `SELECT login, password FROM \`tblUsers\` WHERE login AS ${login} AND password AS ${password}`;

        return querySql(mySqlPool, sql, (fulfill, result) => fulfill(result))
    }
}

// (YOUR) Instance of service.
export const authService = new AuthService();
