class ArticlesController < ApplicationController
  def index
    articles = Article.where("id <= 500").where(:hidden => false).limit(100).order(:count => :desc)
    render :json => {
      :articles => articles.as_json()
    }
  end

  def simple
    articles = Article.where("id <= 500").where(:hidden => false).limit(10).order(:count => :desc)
    render :json => {
      :articles => articles.as_json()
    }
  end

  def show
    article = Article.find(params[:id])

    similar_articles = article.similar_articles

    render :json => {
      :article => article.as_json(),
      :similar_articles => similar_articles.as_json()
    }
  end

  def show
    article = Article.find(params[:id])

    similar_articles = article.similar_articles

    render :json => {
      :article => article.as_json(),
      :similar_articles => similar_articles.as_json()
    }
  end

  def graph
    articles = Article.where("id <= 500").where(:hidden => false).limit(5).order(:count => :desc)

    nodes = []
    links = []

    idx = 0
    node_idx = {}

    articles.each do |a|
      nodes << {:name => a.headline, :group => a.id}
      if node_idx[a.id].nil?
        node_idx[a.id] = idx
        idx += 1
      end

      value = a.similar_articles.count
      a.similar_articles.each do |aa|
        next if aa.id == a.id
        nodes << {:name => aa.headline, :group => a.id}

        if node_idx[aa.id].nil?
          node_idx[aa.id] = idx
          idx += 1
        end

        links << {:source => node_idx[aa.id], :target => node_idx[a.id], :value => rand(value) + 1}
      end
    end

    render :json => {
      data: {
        nodes: nodes,
        links: links
      }
    }
  end
end
