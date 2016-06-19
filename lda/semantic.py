from semanticpy.vector_space import VectorSpace
import sqlite3

texts = []      # docuemnt text
ids = []        # document ids

#conn = sqlite3.connect('../db/development.sqlite3.bak')
conn = sqlite3.connect('../db/development.sqlite3')
c = conn.cursor()
limit = 1000
offset = 5000
limit = 500
offset = 0
rows = c.execute('select * from articles limit {0} offset {1}'.format(limit, offset))

for row in rows:
  #print row
  texts.append(row[1] + " " + row[11])
  ids.append(row[0])

#vector_space = VectorSpace(["The cat in the hat disabled", "A cat is a fine pet ponies.", "Dogs and cats make good pets.","I haven't got a hat."])
vector_space = VectorSpace(texts)

#Search for cat
#print vector_space.search(["cat"])
#Show score for relatedness against document 0

#for id in range(len(ids)):
#  prob = vector_space.related(id)
#  for i in range(len(ids)):
#    if prob[i] > 0.5 and prob[i] < 0.8 and id != i:
#      print(offset + id + 1, offset + i + 1, prob[i])

id = 139
prob = vector_space.related(id)
for i in range(len(ids)):
  if prob[i] > 0.2 and id != i:
    print(offset + id + 1, offset + i + 1, prob[i])