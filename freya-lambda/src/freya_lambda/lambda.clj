(ns freya-lambda.lambda
  "Doc-string here..."
  (:require [cheshire.core :as json]
            [clojure.tools.logging :as log]
            [uswitch.lambada.core :refer [deflambdafn]]))

(defn handle-event [event]
  (log/info :message "Handling event" :event event))

(deflambdafn freya-lambda.lambda.handler
  [in out ctx]
  (log/info :message "Incoming event" :event in)
  (-> (slurp in)
      (json/parse-string keyword)
      handle-event))
