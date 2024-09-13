# The View

サッカーのスタジアム観戦の感想を投稿、共有できるサイトです。
<img width="1440" alt="ホームページ" src="https://github.com/user-attachments/assets/3f072d8e-80a6-42e2-ab34-eb47d6a0ba83">

# ER 図

<img width="1440" alt="ER図" src="https://github.com/user-attachments/assets/0d9f9ce5-a596-4b7f-85a0-25158c416536">

# URL

https://goal-gosiip-e2571a0eef11.herokuapp.com/ <br>
ゲストログインリンクから、メールアドレスとパスワードを入力せずに、ゲストユーザーとしてログインできます。<br>

# サービスの概要・開発背景

- サービスの内容 <br>
  サッカーの試合を実際にスタジアムで観戦した方の感想を投稿できるサービスです。
- サービスのターゲット層 <br>
  サッカーファンであり、スタジアム観戦をした人。また、スタジアム観戦に興味がある人。
- サービスが解決する課題 <br>
  スタジアム観戦をした人は、感想を共有できる。<br>
  これからスタジアム観戦する人は、スタジアムの場所を知ることができ、現地の雰囲気を掴むことができる。
- こだわったこと <br>
  スタジアムの画像を表示し、観戦する際のイメージを持ちやすいようにしました。<br>
  検索機能を作ることで、スタジアムや観戦日などで条件を指定して投稿を探すことができるようにしました。
- 苦労したこと <br>
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
    <img width="720" alt="新規登録ページ" src="https://github.com/user-attachments/assets/5677e42e-bb42-49ef-9e06-53b7ba9fa086">
  </div>
  <div class="mb-4">
    <h3>ログインページ</h3>
    <img width="720" alt="ログインページ" src="https://github.com/user-attachments/assets/0089a6e4-7050-4cb0-9455-e105483ce680">
  </div>
  <div class="mb-4">
    <h3>プロフィール編集ページ</h3>
    <img width="720" alt="プロフィール編集ページ" src="https://github.com/user-attachments/assets/3de909ea-8005-47bf-b336-e82446a62b3b">
  </div>
  <div class="mb-4">
    <h3>マイページ</h3>
    <img width="720" alt="マイページ" src="https://github.com/user-attachments/assets/bcbcc925-d076-41dc-bdd6-b8d8a8a324cd">
  </div>
  <div class="mb-4">
    <h3>検索結果ページ</h3>
    <img width="720" alt="検索結果ページ" src="https://github.com/user-attachments/assets/bf4204d4-bbce-481a-a7e6-7778286c10cc">
  </div>
  <div class="mb-4">
    <h3>投稿詳細ページ<h3>
    <img width="720" alt="投稿詳細ページ" src="https://github.com/user-attachments/assets/e2a1cc76-e2b6-4814-94a2-7abe216d8aca">
  </div>
  <div class="mb-4">
    <h3>投稿編集ページ</h3>
    <img width="720" alt="投稿編集ページ" src="https://github.com/user-attachments/assets/bcf2ad1d-03b6-4267-b48b-4352e94de59e">
  </div>
  <div class="mb-4">
    <h3>新規投稿ページ</h3>
    <img width="720" alt="新規投稿ページ" src="https://github.com/user-attachments/assets/5e0b57db-ded9-407b-b652-5d769a0d2c5b">
  </div>
  <div class="mb-4">
    <h3>ブックマーク一覧ページ</h3>
    <img width="720" alt="ブックマーク一覧ページ" src="https://github.com/user-attachments/assets/401f13e9-8a11-4cdc-b91e-215e84d9a7e6">
  </div>
  <div class="mb-4">
    <h3>順位表ページ</h3>
    <img width="720" alt="順位表ページ" src="https://github.com/user-attachments/assets/fd9c9897-6f7a-45be-af75-c1672c5715ea">
  </div>
  <div class="mb-4">
    <h3>クラブ一覧ページ</h3>
    <img width="720" alt="クラブ一覧ページ" src="https://github.com/user-attachments/assets/8cfc22a9-9efe-4bce-a409-9125dbe3682b">
  </div>
  <div class="mb-4">
    <h3>クラブ詳細ページ</h3>
    <img width="720" alt="クラブ詳細ページ" src="https://github.com/user-attachments/assets/f14aae7b-e240-41bb-b024-5a426908303e">
  </div>
  <div class="mb-4">
    <h3>スタジアム検索ページ</h3>
    <img width="720" alt="スタジアム検索ページ" src="https://github.com/user-attachments/assets/ce1805b2-1cec-4831-91a9-3508bc609cbc">
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
