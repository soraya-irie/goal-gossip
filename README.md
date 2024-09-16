# The View

サッカーのスタジアム観戦の感想を投稿、共有できるサイトです。
<img width="1440" alt="ホームページ" src="https://github.com/user-attachments/assets/0971b9d7-6d97-44cc-bc59-7c283851bdbf">

# ER 図

<img width="1440" alt="ER図" src="https://github.com/user-attachments/assets/0d9f9ce5-a596-4b7f-85a0-25158c416536">

# URL

https://goal-gosiip-e2571a0eef11.herokuapp.com/ <br>
ゲストログインリンクから、メールアドレスとパスワードを入力せずに、ゲストユーザーとしてログインできます。<br>

# サービスの概要・開発背景

- **サービスの内容** <br>
  - サッカーの試合を実際にスタジアムで観戦した方の感想を投稿できるサービスです。
- **サービスのターゲット層** <br>
  - サッカーファンであり、スタジアム観戦をした人。また、スタジアム観戦に興味がある人。
- **サービスが解決する課題** <br>
  - スタジアム観戦をした人は、感想を共有できる。<br>
  - これからスタジアム観戦する人は、スタジアムの場所を知ることができ、現地の雰囲気を掴むことができる。
- **こだわったこと** <br>
  - スタジアムの画像を表示し、観戦する際のイメージを持ちやすいようにしました。<br>
  - 検索機能を作ることで、スタジアムや観戦日などで条件を指定して投稿を探すことができるようにしました。
- **苦労したこと** <br>
  - GoogleMap を表示するのに苦労しました。なぜならバリデーションエラー後や create アクションと update アクションの redirect 後も正しく表示させなければならないからです。<br>
  - 観戦したスタジアムを入力すると、自動でスタジアム名と住所を入力できる機能も苦労しました。GoogleMap と対応した入力をしなければならないからです。

# 使用技術

- Ruby 3.2.2p53
- Rails 7.0.6
- MySQL 8.0
- Docker/Docker-compose
- RSpec 6.1.3
- Google Maps API
  - Maps JavaScript API
  - Geocoding API
  - Places API
- Amazon S3
- FootyStats API
- Heroku
- rubocop-airbnb 6.0.0

# 機能一覧

<div class="d-flex flex-column align-items-center">
  <div class="mb-4">
    <h3>新規登録ページ</h3>
    <img width="720" alt="新規登録ページ" src="https://github.com/user-attachments/assets/3848420b-789a-441c-9b17-b8c86dfe540e">
  </div>
  <div class="mb-4">
    <h3>ログインページ</h3>
    <img width="720" alt="ログインページ" src="https://github.com/user-attachments/assets/6c47a631-6a3f-4142-991c-b186e069adaf">
  </div>
  <div class="mb-4">
    <h3>プロフィール編集ページ</h3>
    <img width="720" alt="プロフィール編集ページ" src="https://github.com/user-attachments/assets/029cd3ba-e0d5-4b72-9076-86658fe28760">
  </div>
  <div class="mb-4">
    <h3>マイページ</h3>
    <img width="720" alt="マイページ" src="https://github.com/user-attachments/assets/4e01884d-9d40-4e7e-bc83-ccddf9d91335">
  </div>
  <div class="mb-4">
    <h3>検索結果ページ</h3>
    <img width="720" alt="検索結果ページ" src="https://github.com/user-attachments/assets/a13d7af5-8431-496d-b7f1-234edf8b92d4">
  </div>
  <div class="mb-4">
    <h3>投稿詳細ページ<h3>
    <img width="720" alt="投稿詳細ページ" src="https://github.com/user-attachments/assets/85eeefd6-f37f-4baf-a979-7f6a967be4fa">
  </div>
  <div class="mb-4">
    <h3>投稿編集ページ</h3>
    <img width="720" alt="投稿編集ページ" src="https://github.com/user-attachments/assets/dd6c288b-ab11-4814-af3c-7240394fbbd9">
  </div>
  <div class="mb-4">
    <h3>新規投稿ページ</h3>
    <img width="720" alt="新規投稿ページ" src="https://github.com/user-attachments/assets/5e0b57db-ded9-407b-b652-5d769a0d2c5b">
  </div>
  <div class="mb-4">
    <h3>ブックマーク一覧ページ</h3>
    <img width="720" alt="ブックマーク一覧ページ" src="https://github.com/user-attachments/assets/9f287003-afd3-4f49-8e66-7023084587fc">
  </div>
  <div class="mb-4">
    <h3>順位表ページ</h3>
    <img width="720" alt="順位表ページ" src="https://github.com/user-attachments/assets/ffc11844-7d1a-4d50-b2d5-1011db8c5ed6">
  </div>
  <div class="mb-4">
    <h3>クラブ一覧ページ</h3>
    <img width="720" alt="クラブ一覧ページ" src="https://github.com/user-attachments/assets/13ac6b8a-3c2a-484b-b576-7d2e6383b225">
  </div>
  <div class="mb-4">
    <h3>クラブ詳細ページ</h3>
    <img width="720" alt="クラブ詳細ページ" src="https://github.com/user-attachments/assets/d40113b5-192a-4a41-834d-68b4bd264511">
  </div>
  <div class="mb-4">
    <h3>スタジアム検索ページ</h3>
    <img width="720" alt="スタジアム検索ページ" src="https://github.com/user-attachments/assets/ae9042a1-ade7-40d6-ae69-8c4a39467010">
  </div>
</div>

- **ユーザー登録・ログイン機能** (devise)
- **投稿機能** (新規投稿, 編集, 削除)
  - Google Map 表示 (Maps JavaScript API)
  - スタジアムのジオコーディング (Geocoding API)
- **ブックマーク機能**
- **検索機能** (ransack)
- **ページネーション機能** (pagy)
- **アイコン画像アップロード** (ActiveStorage, Amazon S3)
- **スタジアム検索機能** (Maps JavaScript API, Geocoding API, Places API)
- **J1 リーグの順位表・クラブ一覧・クラブ詳細表示** (FootyStats API, Maps JavaScript API, Geocoding API)

# テスト

- RSpec
  - Model
  - System
  - Request
