(defproject freya-lambda "0.1.0-SNAPSHOT"
  :description "AWS Lambda function"
  :license {:name "EPL-2.0 OR GPL-2.0-or-later WITH Classpath-exception-2.0"
            :url "https://www.eclipse.org/legal/epl-2.0/"}
  :dependencies [[org.clojure/clojure "1.11.1"]
                 [cheshire "5.10.2"]
                 [com.amazonaws/aws-java-sdk-s3 "1.12.237"]
                 [clj-http "3.12.3"]
                 [org.clojure/tools.logging "1.2.4"]
                 [uswitch/lambada "0.1.2"]]
  :main ^:skip-aot freya-lambda.core
  :target-path "target/%s"
  :profiles {:uberjar {:aot :all
                       :jvm-opts ["-Dclojure.compiler.direct-linking=true"]}})
