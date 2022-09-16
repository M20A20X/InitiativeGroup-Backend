// (YOUR) Sample controller //

// (YOUR) Custom service.
import { authService } from '../services/auth.js';

export class AuthController {
    // (YOUR) Custom controller logic (of course, YOU can have different set of features).
    async get(req, res) {
        // Custom logic...
        // Set response headers
        const {login, password} = req.query;
        res.setHeader('Access-Control-Allow-Origin', '*');
        try {
            if (login === "" || password === ""){
                throw("The login or password field is empty");
            }
            const dbQueryResult = await authService.get(login, password);
            res.json(dbQueryResult);
        } catch (error) {
            res.status(500).json(error.code);
        }
    }
}

// (YOUR) Instance of controller.
export const authController = new AuthController();
