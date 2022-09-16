import { testsService as service } from '../services/tests.js';

export class TestsController {
    // Get //
    async getTestDataById(req, res) {
        res.setHeader('Access-Control-Allow-Origin', '*');

        const { testId } = req.query;

        try {
            res.status(200).send({
                testData: await service.getTestDataById(testId)
            });
        } catch (error) {
            res.status(500).json(error.code);
        }
    }
}

// (YOUR) Instance of controller.
export const testsController = new TestsController();
