(defn is-conn [edges]
  (let [ all-nodes (set (flatten edges))]
    (loop [ visited #{}
            to-visit #{(ffirst edges)} ]
      (let [ [cur & toseq] (seq to-visit)
             visited (conj visited cur)]
        (if-not to-visit
          (= visited all-nodes)
          (recur
           visited
           (into (set toseq)
                 (filter (comp not visited)
                         (for [[a,b] edges
                               :when (or (= cur a) (= cur b)) ]
                           (if (= cur a) b a))))))))))


 (= true (is-conn [[1 2] [2 3] [3 4] [4 1]]))