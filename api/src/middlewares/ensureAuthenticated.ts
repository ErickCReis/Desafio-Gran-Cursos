import { NextFunction, Request, Response } from 'express';

import { auth } from '../config/firebase';
import AppError from '../errors/AppError';

export default async function ensureAuthenticated(
  request: Request,
  _: Response,
  next: NextFunction,
): Promise<void> {
  const authHeader = request.headers.authorization;

  if (!authHeader) {
    throw new AppError('JWT token is missing', 401);
  }

  const [, token] = authHeader.split(' ');

  const secret = process.env.JWT_SECRET;

  if (!secret) {
    throw new Error();
  }

  const isValid = await auth.verifyIdToken(token);

  if (isValid) {
    request.user = {
      id: isValid.uid,
    };

    return next();
  }
  throw new AppError('Invalid JWT token', 401);
}
