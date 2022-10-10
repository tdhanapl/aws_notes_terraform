resource "aws_s3_bucket_website_configuration" "website-config" {
  bucket = data.aws_s3_bucket.selected-bucket.bucket

  redirect_all_requests_to {
    host_name = "https://www.${var.domain_name}"
  }
  
  # IF you want to use the routing rule

  routing_rule {
    condition {
      key_prefix_equals = "/abc"
    }
    redirect {
      replace_key_prefix_with = "comming-soon.jpeg"
    }
  }

}

resource "aws_s3_bucket_website_configuration" "website-config-1" {
  bucket = data.aws_s3_bucket.selected-bucket-1.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "404.jpeg"
  }
  
  # IF you want to use the routing rule

  routing_rule {
    condition {
      key_prefix_equals = "/abc"
    }
    redirect {
      replace_key_prefix_with = "comming-soon.jpeg"
    }
  }

}
