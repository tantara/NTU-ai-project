require 'lda-ruby'
corpus = Lda::DataCorpus.new(Rails.root + "lda/data/ap.dat")

puts corpus.documents
lda = Lda::Lda.new(corpus)    # create an Lda object for training
lda.em_max_iter = 3
lda.max_iter = 3
lda.em("random")              # run EM algorithm using random starting points
lda.load_vocabulary(Rails.root + "lda/data/vocab.txt")
lda.print_topics(20)          # print all topics with up to 20 words per topic