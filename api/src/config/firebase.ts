/* eslint-disable @typescript-eslint/no-var-requires */
import * as admin from 'firebase-admin';

const serviceAccount = require('../../serviceAccountKey.js');

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

const auth = admin.auth();

export default auth;
