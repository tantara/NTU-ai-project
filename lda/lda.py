from gensim import corpora, models
import gensim
import sqlite3

texts = []      # docuemnt text
ids = []        # document ids

#conn = sqlite3.connect('../db/development.sqlite3.bak')
conn = sqlite3.connect('../db/development.sqlite3')
c = conn.cursor()
#rows = c.execute('select * from articles limit 1000')
rows = c.execute('select * from articles limit 500')

for row in rows:
  #print row[11]
  if row[1] and row[11]:
    texts.append(row[1].split() + row[11].split())# + row[11].split())
    #texts.append(row[11].split())# + row[11].split())
    ids.append(row[0])

# create corpus and dictionary
dictionary = corpora.Dictionary(texts)
corpus = [dictionary.doc2bow(text) for text in texts]

# learn lda model
ldamodel = gensim.models.ldamodel.LdaModel(corpus, num_topics=100, id2word = dictionary, passes=20)

#example
#print(ldamodel.print_topics(num_topics=20, num_words=7))
t = "Stephen Curry".split()
#lda = ldamodel[dictionary.doc2bow(texts[500])]
lda = ldamodel[dictionary.doc2bow(t)]
print(lda[0][0])
print(ldamodel.print_topic(lda[0][0]))
#print(texts[500])
print(t)


#check document topic and related document by topic
group = dict()
for i in range(len(texts)):
  lda = ldamodel[dictionary.doc2bow(texts[i])]
  if lda:
    if group.has_key(lda[0][0]) == False:
      group[lda[0][0]] = []
    group[lda[0][0]].append(ids[i])

print(group)