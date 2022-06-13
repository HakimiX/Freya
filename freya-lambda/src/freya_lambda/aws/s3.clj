(ns freya-lambda.aws.s3
  (:require [freya-lambda.util :as util])
  (:import (com.amazonaws.services.s3 AmazonS3ClientBuilder)
           (com.amazonaws.services.s3.model GetObjectRequest ObjectMetadata PutObjectRequest)))

(def client (AmazonS3ClientBuilder/defaultClient))

(defn get-object
  [client bucket key]
  (->> (GetObjectRequest. bucket key)
       (.getObject client)
       (.getObjectContent)))

(defn upload-object
  [client bucket key data]
  (->> (PutObjectRequest. bucket key (util/string->input-stream data) (ObjectMetadata.))
       (.putObject client)))
