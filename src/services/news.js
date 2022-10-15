import { mySqlPool } from '#config/mySql.js';
import { querySql } from '#helpers/sql.js';

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
    async PostNews(text, imageUrl) {
        const sql = `call sp_PostNews('${text}', '${imageUrl}');`;
        return querySql(mySqlPool, sql, (fulfill, result) => fulfill(result));
    }
}

export const newsService = new NewsService();
