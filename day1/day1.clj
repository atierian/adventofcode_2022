(ns day1
  (:require [clojure.string :as s]
            [clojure.java.io :as io]))

(defn parse-input [input]
  (for [group (s/split input #"\n\n")]
    (for [line (s/split-lines group)]
      (Integer/parseInt line))))

(def input (parse-input (slurp (io/resource "day1_input"))))

(defn sum [n]
  (reduce + n))

(defn elves [input]
  (->> input
       (map sum)
       (sort >)))

(def elves-calories (elves input))

;; part-one
(comment
  (take 1 elves-calories))

;; part-two
(comment
  (sum (take 3 elves-calories)))
