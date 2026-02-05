const mod_hmac = require('crypto');

const NOW = new Date();

function s3date(r) {
    return NOW.toUTCString();
}

function uri_path(r) {
  const bucket = process.env['S3_BUCKET_NAME'];
  return '/' + bucket + '/' + r.variables.stream;
}

function signature(r) {
  const accessKeyId = process.env['AWS_ACCESS_KEY_ID'];
  const secretAccessKey = process.env['AWS_SECRET_ACCESS_KEY'];
  const httpDate = s3date(r);
  const uri = uri_path(r);
  const method = r.method;

  const hmac = mod_hmac.createHmac('sha1', secretAccessKey);
  const stringToSign = method + '\n\n\n' + httpDate + '\n' + uri;

  const signature = hmac.update(stringToSign).digest('base64');

  return `AWS ${accessKeyId}:${signature}`;
}

export default {
    signature,
    s3date
}
