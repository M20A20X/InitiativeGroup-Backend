import { mySqlPool } from '#config/mySql.js';
import { querySql } from '#helpers/sql.js';

class ProjectsService {
    async getProjects() {
        const sql = 'SELECT * FROM `tblProjects`;';

        return new Promise((fulfill, reject) => {
            mySqlPool.query(sql, (error, result) => {
                if (error) {
                    reject(error);
                }

                fulfill(result);
            });
        });
    }
    async PostProjects(text, imageUrl) {
        const sql = `call sp_PostProjects('${text}', '${imageUrl}');`;
        return querySql(mySqlPool, sql, (fulfill, result) => fulfill(result));
    }
}

export const projectsService = new ProjectsService();
