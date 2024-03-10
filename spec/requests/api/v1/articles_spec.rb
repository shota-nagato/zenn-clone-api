require "rails_helper"

RSpec.describe "Api::V1::Articles", type: :request do
  describe "GET api/v1/articles" do
    subject { get api_v1_articles_path, params: }

    before do
      create_list(:article, 30, status: :published)
      create_list(:article, 8, status: :draft)
    end

    context "pageをparamsで指定しない場合" do
      let(:params) { nil }

      it "1ページ目のレコードを取得出来る" do
        subject
        res = JSON.parse(response.body)
        headers = response.headers

        expect(headers["current-page"]).to eq "1"
        expect(headers["page-items"]).to eq "20"
        expect(headers["total-pages"]).to eq "2"
        expect(headers["total-count"]).to eq "30"
        expect(res.length).to eq 20
        expect(res[0].keys).to eq %w[id title content status created_at from_today user]
        expect(response).to have_http_status(:ok)
        assert_schema_conform(200)
      end
    end

    context "pageをparamsで指定した場合" do
      let(:params) { {page: 2} }

      it "該当ページ目のレコードを取得出来る" do
        subject
        res = JSON.parse(response.body)
        headers = response.headers

        expect(headers["current-page"]).to eq "2"
        expect(headers["page-items"]).to eq "20"
        expect(headers["total-pages"]).to eq "2"
        expect(headers["total-count"]).to eq "30"
        expect(res.length).to eq 10
        expect(res[0].keys).to eq %w[id title content status created_at from_today user]
        expect(response).to have_http_status(:ok)
        assert_schema_conform(200)
      end
    end
  end

  describe "GET api/v1/articles/:id" do
    subject { get api_v1_article_path(article) }

    let(:article) { create(:article, status:) }

    context "article_idに対応するレコードが存在するとき" do
      context "レコードのステータスが公開中のとき" do
        let(:status) { :published }
        it "正常にレコードを取得出来る" do
          subject
          res = JSON.parse(response.body)
          expect(res.keys).to eq %w[id title content status created_at from_today user]
          expect(res["user"].keys).to eq ["name"]
          expect(response).to have_http_status(:ok)
          assert_schema_conform(200)
        end
      end

      context "レコードのステータスが下書きのとき" do
        let(:status) { :draft }

        it "ActiveRecord::RecordNotFoundエラーが返る" do
          expect { subject }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end

    context "article_idに対応するレコードが存在しない場合" do
      let(:article_id) { 1000 }

      it "ActiveRecord::RecordNotFoundエラーが返る" do
        expect { subject }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
