(defn is-conn [edges]
  (let [ all-nodes (set (flatten (seq edges)))]
    (loop [ visited #{}
            to-visit [(ffirst edges)] ]
      (if (empty? to-visit)
        (= visited all-nodes)
        (let [ [cur & to-visit] to-visit
               visited (conj visited cur)]
          (recur visited
                 (concat
                   to-visit
                   (distinct
                   (filter (comp not visited)
                           (for [[a,b] edges
                                 :when (or (= cur a) (= cur b)) ]
                             (if (= cur a) b a)))))))))))

(= true (is-conn #{[:a :a]}))

 (= true (is-conn [[1 2] [2 3] [3 4] [4 1]]))

 (= false (is-conn #{[:a :b] [:b :c] [:c :d]
               [:x :y] [:d :a] [:b :e]}))

