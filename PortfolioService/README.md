# README

## Add S3 storage configuration

Application use S3 storage. To configure it create `.env` file in main directory and add this variables definition:
- S3_BUCKET_NAME
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- AWS_REGION

## Add Twitter credential

Application use Twitter. In `.env` file in main directory and add this variables definition:

- TWITTER_CONSUMER_KEY
- TWITTER_CONSUMER_SECRET
- TWITTER_ACCESS_TOKEN
- TWITTER_ACCESS_SECRET

## Used gems
- petergate - for user authorization
- kaminari - for paggination in blog section
- bootstrap4-kaminari-views - bootstrap styling pagination
- carrierwave
- mini_magick - pictures transformation
- carrierwave-aws
- dotenv-rails - for create .env file to store credentials
- cocoon - for nested form
- gritter - nice flash alerts and notification
- twitter - conect to Twitter and get tweets
- redis
