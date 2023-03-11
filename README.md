# README

Railsを使ったテンプレートプロジェクトです

# 起動の方法（ローカル環境）

`bin/dev`で起動する。

# 起動の方法（Docker環境）

以下のブログを参考に。

https://sinsoku.hatenablog.com/entry/2021/03/24/100000

初回の環境構築は、`docker-compose build`でDockerイメージを作成して`bin/setup`を実行する。

```shell
$ docker-compose build
$ docker-compose run --rm web bin/setup
```

その後は、`docker-compose run --rm --service-ports web`でサーバを起動する。

```shell
$ docker-compose run --rm --service-ports web
```

作業中に`debug` gemのインストールが失敗することがあったので、以下のコマンドを実行して全てのvolumeを削除して、再度`bin/setup`を実行するとうまくいった。

```shell
$ docker-compose down --volumes
```

コンテナ内で作業するときは、以下のコマンドを実行する。

```shell
$ docker-compose run --rm web bash
```

# Bootstrapの導入方法

Bootstrapの導入方法については、[Rails7時代のJS/CSSバンドルの新常識](https://hazm.jp/archives/147)を参考に、[cssbundling-rails](https://github.com/rails/cssbundling-rails)を使って導入した。

# RailsのHTMLタグにおけるclassの指定方法

RailsのHTMLタグにおけるclassの指定方法については、[RailsのFormBuilderのAPI](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html)を確認すること。

# エラーが発生したフォームに付与するHTMLタグのカスタマイズ

[Railsアプリケーションを設定する（Railsガイド）](https://railsguides.jp/configuring.html#config-action-view-field-error-proc)

# スタイルの継承

Sassの`@extend`を使用すると実装可能。

[エクステンドでスタイルを継承する（まくまくSaasノート）](https://maku77.github.io/sass/extend.html)

# LogのJSON化

最初は[Lograge](https://github.com/roidrage/lograge)でも使えばいいかなと思っていたんだけれども、Rails 7への対応が明記されていないので、[Semantic Logger](https://logger.rocketjob.io/rails)を使ってみることにした。

# Railsのバリデーション

基本は[RailsガイドのActive Recordバリデーション](https://railsguides.jp/active_record_validations.html)を参照。

# Prettierの導入

ICS Mediaの以下の記事を参考にした。

- [Prettierの導入方法 フロントエンド開発で必須のコード整形ツール](https://ics.media/entry/17030/)

