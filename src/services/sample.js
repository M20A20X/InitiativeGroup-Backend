// (YOUR) Sample service //
import { mySqlPool } from '../config/mySql.js';

class SampleService {
    // (YOUR) custom service logic (of course, YOU can have different set of features).
    async get() {
        // Custom logic...
        const sql = 'SELECT * FROM `tblUsers`;';

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

// (YOUR) Instance of service.
export const sampleService = new SampleService();
