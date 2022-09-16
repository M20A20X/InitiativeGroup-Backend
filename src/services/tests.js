import { mySqlPool as pool } from '#config/mySql.js';
import { querySql } from '#helpers/sql.js';

class TestsService {
    async getTestDataById(testId) {
        const sql = {
            test: `CALL sp_getTestById(${testId});`,
            questions: `CALL sp_getQuestionsByTestId(${testId});`,
            questTypes: 'CALL sp_getQuestTypes();'
        };

        const common = await querySql(pool, sql.test, (fulf, result) =>
            fulf(result[0][0])
        );

        const questionsArr = await querySql(
            pool,
            sql.questions,
            (fulf, result) => fulf(result[0])
        );

        const questTypesArr = await querySql(
            pool,
            sql.questTypes,
            (fulf, result) => fulf(result[0])
        );

        return { common, questionsArr, questTypesArr };
    }
}

export const testsService = new TestsService();
