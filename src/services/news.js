import { mySqlPool } from '#config/mySql.js';

class NewsService {
    async getNews() {
        const sql = 'SELECT * FROM `tblNews`;';

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

export const newsService = new NewsService();
