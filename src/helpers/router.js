import { Router } from 'express';

export const createChildRouter = () => Router({ mergeParams: true });
