(defproject freya-lambda "0.1.0-SNAPSHOT"
  :description "AWS Lambda function"
  :dependencies [[org.clojure/clojure "1.11.1"]
                 [cheshire "5.10.2"]
                 [clj-http "3.12.3"]
                 [org.clojure/tools.logging "1.2.4"]

                 ;; AWS Libraries
                 [com.amazonaws/aws-java-sdk-s3 "1.12.237"]
                 [com.amazonaws/aws-java-sdk-lambda "1.11.1000"]

                 [uswitch/lambada "0.1.2"]]
  :main ^:skip-aot freya-lambda.core
  :target-path "target/%s"
  :profiles {:uberjar {:aot :all
                       :jvm-opts ["-Dclojure.compiler.direct-linking=true"]}})
