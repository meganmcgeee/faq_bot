const admin = require('firebase-admin');
const serviceAccount = require('path/to/serviceAccountKey.json');

admin.initializeApp({
  credential: admin.credential.cert({
    projectId: '<PROJECT_ID>',
    clientEmail: 'foo@<PROJECT_ID>.iam.gserviceaccount.com',
    privateKey: '-----BEGIN PRIVATE KEY-----\n<KEY>\n-----END PRIVATE KEY-----\n'
  }),
  databaseURL: 'https://<DATABASE_NAME>.firebaseio.com'
});
