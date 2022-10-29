import { authService } from '#services/auth.js';
import bcrypt from 'bcrypt';

class AuthController {
    async registration(req, res) {
        try {
            const { email, login, name, password, telephone } = req.body;
            const salt = await bcrypt.genSalt(10);
            const passwordHash = await bcrypt.hash(password, salt);
            const dbQueryResult = await authService.registration(
                email,
                login,
                name,
                passwordHash,
                telephone
            );
            res.json(dbQueryResult);
        } catch (e) {
            res.status(500).json(e.code);
        }
    }

    async login(req, res) {
        try {
            const { email, password } = req.body;
            const dbQueryResult = await authService.login(email);
            const validPassword = bcrypt.compareSync(
                password,
                dbQueryResult[0].password
            );
            if (!validPassword) {
                res.status(400).json({ message: 'wrong password' });
            } else {
                res.json(dbQueryResult);
            }
        } catch (e) {
            res.status(500).json(e.code);
        }
    }

    async getUsers(req, res) {
        try {
            res.json('Server go');
        } catch (e) {
            res.status(500).json(e.code);
        }
    }
}

export const authController = new AuthController();
