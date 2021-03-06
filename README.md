# JOBLINK

## 概要
Ruby on Rails × Docker × AWSで作成した、技術ポートフォリオとしてのビジネスSNSです。
<br>
相手や求人を検索し、気になったものがあればチャットでコミュニケーションをとることができます。

- [JOBLINK](https://joblink-net.com/)
  - ユーザータイプ(求人者 or 求職者)を選択し、メールアドレスとパスワードを入力すると全ての機能をご利用いただけます。
  - 各ユーザータイプのアカウント登録 or ログイン画面から、一部機能に制限を設けた"ゲストユーザー"として"かんたんログイン"をすることもできます。
  - 未ログインの状態でも、求人・各ユーザーの一覧および詳細表示はご利用いただけます。

<img width="1421" alt="20200426_JOBLINK_TOP" src="https://user-images.githubusercontent.com/54879050/80285959-89b3de80-8763-11ea-86fa-50a214badf38.png">

## 使用技術
### 一覧
- バックエンド
  - Ruby: 2.6.5
  - Rails: 6.0.2.1
- フロントエンド
  - slim
  - sass
  - jQuery
  - MaterializeCSS
- データベース
  - MySQL: 8.0.17
- インフラストラクチャー
  - サーバー
    - アプリケーションサーバー: Puma
    - Webサーバー: Nginx
  - 開発環境
    - Docker: 19.03.8
    - docker-compose: 1.25.4
  - AWS
    - VPC
    - ECS
    - ECR
    - RDS for MySQL
    - ElastiCache Redis
    - S3
    - SES
    - ALB
    - ACM
    - Route53
    - CloudWatch
  - ソースコード管理
    - Git
    - GitHub
### インフラアーキテクチャ図
![JOBLINK_ver1 1](https://user-images.githubusercontent.com/54879050/82392094-f3cb5500-9a7d-11ea-9e38-ff61c411e12a.png)

## 機能
- ユーザー管理
  - アカウント登録、ログイン/ログアウト、ログイン情報編集、アカウント削除(devise)
  - メール認証(SES)
- ユーザープロフィール管理
  - 新規作成、編集
  - 一覧表示、詳細表示
  - アバター画像変更(ActionStorage)
  - レジュメ作成、編集 -> リッチテキスト(ActionText) ※求職者のみ
- 求人管理
  - 新規作成、編集、削除
  - 一覧表示、詳細表示
  - ヘッダー画像変更(ActionStorage)
  - 本文編集 -> リッチテキスト(ActionText)
  - ブックマーク(Ajax)
- ユーザー・求人検索(ransack)
- ユーザー・求人タグ付け、タグによる検索(acts-as-taggable-on)
- 一覧表示のページネーション(kaminari)
- リアルタイムチャット
  - チャットルーム作成、退出
  - 送信メッセージのリアルタイム反映(ActionCable, アダプターとしてElastiCache Redis)
- 自動単体テスト(Rspec)
- 自動結合テスト(Rspec)

## アピールポイント
- Railsやgemのバージョンをなるべく最新に近づけて開発に挑戦！
- 使いやすさを意識したUI/UX！
- 開発環境でDocker, docker-composeを利用、本番環境のコンテナ基盤にはECSを採用することでモダンなインフラを構築！
- AWSのマネージドサービスを多数使用！
- master, develop, feature, fix, hotfixとブランチを切り分けることで実際のチーム開発を意識！
- 途中からはpull request, issueも活用し、GitHubの習得を意識！
