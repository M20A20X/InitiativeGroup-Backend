import { mySqlPool } from '#config/mySql.js';

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
}

export const projectsService = new ProjectsService();
