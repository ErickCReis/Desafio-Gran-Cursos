module.exports = {
  type: 'service_account',
  project_id: 'desafio-gran-cursos',
  private_key_id: '8ede7178b980b978d79e40a8fea44511f7adf5b8',
  private_key: process.env.FIREBASE_PRIVATE_KEY,
  client_email: process.env.FIREBASE_CLIENT_EMAIL,
  client_id: '113037235427537725544',
  auth_uri: 'https://accounts.google.com/o/oauth2/auth',
  token_uri: 'https://oauth2.googleapis.com/token',
  auth_provider_x509_cert_url: 'https://www.googleapis.com/oauth2/v1/certs',
  client_x509_cert_url:
    'https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-b0igh%40desafio-gran-cursos.iam.gserviceaccount.com',
};
