import { mySqlPool } from '#config/mySql.js';
import { querySql } from '#helpers/sql.js';

class ProfileService {
    async getUserData(userId) {
        const sql = `CALL sp_getUserData(${userId});`;

        return querySql(mySqlPool, sql, (fulfill, result) => {
            fulfill(result);
        });
    }

    async postVote(userId, Unity, Front, Back) {
        const sql = `CALL sp_postVote(${userId}, ${Unity}, ${Front}, ${Back});`;
        return querySql(mySqlPool, sql, (fulfill, result) => {
            fulfill(result);
        });
    }
}

export const profileService = new ProfileService();
