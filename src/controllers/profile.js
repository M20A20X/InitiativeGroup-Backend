import { profileService } from '#services/profile.js';

class ProfileController {
    async getUserData(req, res) {
        res.setHeader('Access-Control-Allow-Origin', '*');
        try {
            const { userId } = req.query;
            res.status(200).json(await profileService.getUserData(userId));
        } catch (error) {
            return res.status(400).json({ message: 'wrong id' });
        }
    }

    async postVote(req, res) {
        res.setHeader('Access-Control-Allow-Origin', '*');
        try {
            const { userId, unity, front, back } = req.body;
            res.status(200).json(
                await profileService.postVote(userId, unity, front, back)
            );
        } catch (error) {
            return res.status(400).json({ message: 'wrong vote' });
        }
    }
}

export const profileController = new ProfileController();
