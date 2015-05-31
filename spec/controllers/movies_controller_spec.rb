require 'spec_helper'
require 'pp'

describe MoviesController do
  render_views
  describe "index" do
    before do
      Movie.create!(name: 'The Shinning' , description: 'Horror' , duration: 90)
      Movie.create!(name: 'The Good Fellas' , description: 'Crime' , duration: 90)
      Movie.create!(name: 'Django Unchained' , description: 'Crime' , duration: 90)
      Movie.create!(name: 'Star Wars' , description: 'sci-fi' , duration: 90)

      pp Movie.all
      xhr :get, :index, format: :json, keywords: keywords
    end

    subject(:results) { JSON.parse(response.body) }

    def extract_name
      ->(object) { object["name"] }
    end

    context "when the search finds results" do
      let(:keywords) { 'The' }
      it 'should 200' do
        pp response.body
        expect(response.status).to eq(200)
      end
      it 'should return two results' do
        expect(results.size).to eq(2)
      end
      it "should include 'The Shinning'" do
        expect(results.map(&extract_name)).to include('The Shinning')
      end
      it "should include 'The Good Fellas'" do
        expect(results.map(&extract_name)).to include('The Good Fellas')
      end
    end

    context "when the search doesn't find results" do
      let(:keywords) { 'foo' }
      it 'should return no results' do
        expect(results.size).to eq(0)
      end
    end

  end

  describe "show" do
    before do
      xhr :get, :show, format: :json, id: movie_id
    end

    subject(:results) { JSON.parse(response.body) }

    context "when the movie exists" do
      let(:movie) { 
        Movie.create!(name: 'The Shinning', 
               description: "Horror") 
      }
      let(:movie_id) { movie.id }

      it { expect(response.status).to eq(200) }
      it { expect(results["id"]).to eq(movie.id) }
      it { expect(results["name"]).to eq(movie.name) }
      it { expect(results["description"]).to eq(movie.description) }
    end

    context "when the movie doesn't exit" do
      let(:movie_id) { -9999 }
      it { expect(response.status).to eq(404) }
    end
  end
end