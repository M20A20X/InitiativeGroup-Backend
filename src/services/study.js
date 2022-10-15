import { mySqlPool } from '#config/mySql.js';
import { querySql } from '#helpers/sql.js';

class StudyService {
    async getStudy() {
        const sql = 'SELECT * FROM `tblStudy`;';

        return new Promise((fulfill, reject) => {
            mySqlPool.query(sql, (error, result) => {
                if (error) {
                    reject(error);
                }

                fulfill(result);
            });
        });
    }
    async PostStudy(text, imageUrl) {
        const sql = `call sp_PostStudy('${text}', '${imageUrl}');`;
        return querySql(mySqlPool, sql, (fulfill, result) => fulfill(result));
    }
}

export const studyService = new StudyService();
