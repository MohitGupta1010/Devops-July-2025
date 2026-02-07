# Cloud Front

- AWS's Speedy Delievery Guy

- Called as CDN (Content Delivery Network)
- It makes your website, videos, APIs, files load faster by serving them from near by locations of users.

- Cloudfront provides buit in security using https.

- User trying to access your website --> req goes to nearby edge location of cloudfront -> if content exist -> serve it quickly

- if content not exist -> cloudfront fetch from origin (s3/ec2)
- catche for next users.

## Seteps to execute

- create s3 bucket: sonam-cloudfront-demo
- enable versioning, un check public access points
- create

- Then upload your html content to bucket
- bucket -> properties -> static site hosting -> enter index.html -> save

- Now bucket policy add policy to read object

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Statement1",
      "Effect": "Allow",
      "Principal": "*",
      "Action": [
        "s3:GetObject"
      ],
      "Resource": "arn:aws:s3:::sonam-cloudfront-demo/*"
    //   add your bucket ARN here
    }
  ]
}
```
- save you can check again unde static site hosting with one URL where you can access page but its not secure and optimized

## Cloud Front

- Goto CloudFront -> create distribution -> free -> next
- select Amazon S3 -> bucket endpoint will come after selecting bucket
- Origin access
- Viewer Protocol Policy: Redirect HTTP to https
- click on create

- it will take 2-5 minutes of time to start
- then access Distribution domain name in browser