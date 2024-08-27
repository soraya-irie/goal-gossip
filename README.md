# The View

サッカーのスタジアム観戦の感想を投稿、共有できるサイトです。
<img width="1440" alt="スクリーンショット 2024-08-27 13 52 22" src="https://github.com/user-attachments/assets/3f072d8e-80a6-42e2-ab34-eb47d6a0ba83">

# ER 図

<img width="1440" alt="スクリーンショット 2024-08-27 15 57 21" src="https://github.com/user-attachments/assets/0d9f9ce5-a596-4b7f-85a0-25158c416536">

# URL

https://goal-gosiip-e2571a0eef11.herokuapp.com/
ゲストログインリンクから、メールアドレスとパスワードをメールアドレスとパスワードを入力せずに、ゲストユーザーとしてログインできます。

# サービスの概要・　開発背景

- サービスの内容 <br>
  サッカーの試合を実際にスタジアムで観戦した方の感想を投稿できるサービスです。
- サービスのターゲット層 <br>
  サッカーファンであり、スタジアム観戦をした人。また、スタジアム観戦に興味がある人
- サービスが解決する課題 <br>
  スタジアム観戦をした人は、感想を共有できる。<br>
  これからスタジアム観戦する人は、スタジアムの場所を知ることができ、現地の雰囲気を掴むことができる。
- こだわったこと <br>
  スタジアムの画像を表示し、観戦する際のイメージを持ちやすいようにしました。<br>
  検索機能を作ることで、スタジアムや観戦日などで条件を指定して投稿を探すことができるようにしました。

# 使用技術

- Ruby 3.2.2p53
- Rails 7.0.6
- MySQL 8.0
- Docker/Docker-compose
- RSpec 6.1.3
- Google Maps API
  - Maps JavaScript API
  - Geocoding API
- Heroku
- rubocop-airbnb 6.0.0

# 機能一覧

- ユーザー登録、、ログイン機能(devise)
- 投稿機能
  - Google Map 表示機能
  - スタジアムのジオコーディング機能
- ブックマーク機能 -検索機能(ransack)
- ページネーション機能(pagy)

# テスト

- RSpec
  - Model
  - System
  - Request
