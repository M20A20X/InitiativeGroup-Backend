import { mySqlPool } from '#config/mySql.js';

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
}

export const studyService = new StudyService();
