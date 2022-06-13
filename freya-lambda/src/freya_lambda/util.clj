(ns freya-lambda.util
  (:require [clojure.java.io :as io])
  (:import (java.io ByteArrayInputStream)))

(defn string->input-stream [s]
  (io/input-stream (ByteArrayInputStream. (.getBytes s))))
