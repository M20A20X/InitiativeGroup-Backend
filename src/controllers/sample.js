// (YOUR) Sample controller //

// (YOUR) Сustom service.
import { sampleService } from '../services/sample.js';

export class SampleController {
    // (YOUR) Сustom controller logic (of course, YOU can have different set of features).
    async get(req, res) {
        // Custom logic...
        // Set response headers
        res.setHeader('Access-Control-Allow-Origin', '*');
        try {
            const dbQuerryResult = await sampleService.get();
            res.json(dbQuerryResult);
        } catch (error) {
            res.status(500).json(error.code);
        }
    }
}

// (YOUR) Instance of controller.
export const sampleController = new SampleController();
