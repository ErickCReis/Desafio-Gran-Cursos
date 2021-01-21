import { ErrorRequestHandler, Request, Response } from 'express';
import AppError from './AppError';

const ErrorHandler: ErrorRequestHandler = (
  error: Error,
  _: Request,
  response: Response,
) => {
  console.log(error);

  if (error instanceof AppError) {
    return response.status(error.statusCode).json({
      status: 'error',
      message: error.message,
    });
  }

  return response.status(500).json({
    status: 'error',
    message: 'Internal server error',
  });
};
export default ErrorHandler;
