(ns freya-lambda.lambda
  "Doc-string here..."
  (:require [cheshire.core :as json]
            [clj-http.client :as client]
            [clojure.tools.logging :as log]
            [uswitch.lambada.core :refer [deflambdafn]]))

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
