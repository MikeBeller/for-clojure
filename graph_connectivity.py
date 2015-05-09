def is_conn(edges):
  all_nodes = set(a for a,b in edges) | set(b for a,b in edges)
  to_visit = set([all_nodes.copy().pop()])
  visited = set()
  while to_visit:
    n = to_visit.pop()
    visited.add(n)
    for a,b in edges:
      if b == n:
        a,b = b,a
      if a == n:
        if b not in visited:
          to_visit.add(b)
  return visited == all_nodes


t1 = set([(1,2), (2,3), (3,1)])
assert is_conn(t1)

t2 = set([(1,2), (2,3), (3,1), (4,5), (5,6), (6,4)])
assert not is_conn(t2)

t3 = set([(1,2), (2,3), (3,1), (4,5), (5,6), (6,4), (3,4)])
assert is_conn(t3)