(ns freya-lambda.aws.s3
  (:import (com.amazonaws.services.s3 AmazonS3ClientBuilder)
           (com.amazonaws.services.s3.model GetObjectRequest ObjectMetadata PutObjectRequest)))

(defn get-object
  [client bucket key]
  (->> (GetObjectRequest. bucket key)
       (.getObject client)
       (.getObjectContent)))
