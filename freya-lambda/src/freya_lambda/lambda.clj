(ns freya-lambda.lambda
  "Doc-string here..."
  (:require [cheshire.core :as json]
            [clj-http.client :as client]
            [clojure.tools.logging :as log]
            [freya-lambda.util :as util]
            [uswitch.lambada.core :refer [deflambdafn]])
  (:import (com.amazonaws.services.lambda.model GetFunctionConfigurationRequest)
           (com.amazonaws.services.lambda AWSLambdaClientBuilder)))

(def ^:private lambda-client (AWSLambdaClientBuilder/defaultClient))

(defn get-env-vars
  "Returns a hash-map of the lambda environment variables"
  [lambda-name]
  (let [request (-> (GetFunctionConfigurationRequest.)
                    (.withFunctionName lambda-name))]
    (-> (.getFunctionConfiguration lambda-client request)
        .getEnvironment
        bean
        :variables
        util/string->keyword)))

;; TODO: url should come from lambda environment variable
(defn fetch-data [url]
  (select-keys (client/get url) [:status :body]))

(defn handle-event [event]
  (log/info :message "Handling event" :event event))

(deflambdafn freya-lambda.lambda.handler
  [in out ctx]
  (log/info :message "Incoming event" :event in)
  (-> (slurp in)
      (json/parse-string keyword)
      handle-event))
