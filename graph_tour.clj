(defn tour
  [[[a b] & es]]
    (boolean (or (nil? es)
        (some boolean
          (for [i (range (count es))
                :let [[a' b'] (nth es i)
                    ev (vec es)
                    bef (subvec ev 0 i)
                    aft (subvec ev (inc i))
                    ]]
              (cond
                (= b a') (tour (concat [[a' b']] bef aft))
                (= b b') (tour (concat [[b' a']] bef aft))
                :else false))))))

(assert
 (= false (tour [[:a :b] [:a :b] [:a :c] [:c :a]
               [:a :d] [:b :d] [:c :d]]))
 )

(assert
 (= true (tour [[:a :b] [:a :c] [:c :b] [:a :e]
              [:b :e] [:a :d] [:b :d] [:c :e]
              [:d :e] [:c :f] [:d :f]]))
 )
