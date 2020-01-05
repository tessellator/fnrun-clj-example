(ns sample.core
  (:require [fnrun.core :refer [run]]))

(def counter (atom 0))

(defn handler [event _ctx]
  (if (= event "Chad")
    {:status 404
     :body ""}
    (let [count (swap! counter inc)]
      {:status 200
       :body (format "Hello, %s! %s calls" event count)})))

(defn -main [& args]
  (run handler))
