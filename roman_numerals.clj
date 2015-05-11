(defmacro dbg[x] `(let [x# ~x] (println "dbg:" '~x "=" x#) x#))

(defn roman [romanstr]
  (let [digits (map {\M 1000 \D 500 \C 100 \L 50 \X 10 \V 5 \I 1} romanstr)]
    (reduce
      (fn [s [a b]] (if (>= a b) (+ s a) (- s a)))
      0
      (map vector digits (concat (drop 1 digits) [0])))))
      

(assert (= 14 (roman "XIV")))
(roman "DCCCXXVII")
