(ns freya-lambda.lambda
  "Doc-string here..."
  (:require [clojure.tools.logging :as log]
            [uswitch.lambada.core :refer [deflambdafn]]))

(deflambdafn freya-lambda.lambda.handler
  [in out ctx]
  (log/info :message "Incoming event" :event in))
