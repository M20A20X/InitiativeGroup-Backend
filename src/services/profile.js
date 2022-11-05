import { mySqlPool } from '#config/mySql.js';
import { querySql } from '#helpers/sql.js';

class ProfileService {
    async getUserData(userId) {
        const sql = `SELECT * FROM \`tblUsers\` \`u\`
                     WHERE \`u\`.\`id\` = '${userId}';`;

        return querySql(mySqlPool, sql, (fulfill, result) => {
            fulfill(result);
        });
    }
    //TODO: create new tables Votes and Cases    @Morozova
    async postVote(userId, Unity, Front, Back) {
        const sql = `CALL sp_postVote(${userId}, ${Unity}, ${Front}, ${Back});`;
        return querySql(mySqlPool, sql, (fulfill, result) => {
            fulfill(result);
        });
    }
}

export const profileService = new ProfileService();
