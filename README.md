# Serverless App with Ruby for Vue-calendar
## Vue-calendar
https://github.com/fujisawaryohei/vue-calendar
## Todo
- [x] ServerlssFrameWorkでServerlss構成のコード化とデプロイ
- [x] AWS SDK For Rubyを使用してデプロイしたLambdaでレスポンスができるか確認
- [x] LambdaからDynamoDBにGetItemする
- [ ] LambdaからQueryStringを使用してDynamoDBにGetItemする
- [ ] LambdaからDynamoDBでPutItemする
- [x] 資料作り

# 仕様
### DynamoDB
- ID            パーティションキー       String
- TimeStamp     ソートキー            String
- content                            String

### lambda
- GETに対応したLambdaハンドラー（API GatewayからQuery String取得して→DynamoDBで検索かける）
- POSTに対応したLambdaハンドラー（API GatewayからRequest bodyを取得して→DynamoDBで保存）

### API Gateway
- GET /todo?date=2020-10-1 とかで
- POST /todo request body { todo: string, date: timestamp }

### Client
Vue.js（ https://github.com/fujisawaryohei/vue-calendar ）
- カレンダーの日付をクリックするとGETするようにする
- 「追加する」をクリックするとPOSTするようにする

