#!/bin/bash

echo "プロジェクト名を入力してください:"
read PROJECT_NAME

echo "プロジェクト概要を入力してください:"
read PROJECT_DESC

# プレースホルダーを置換
find . -type f -not -path "./.git/*" -exec sed -i "" "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" {} +
find . -type f -not -path "./.git/*" -exec sed -i "" "s/{{PROJECT_DESC}}/$PROJECT_DESC/g" {} +

# READMEを生成
mv README.template.md README.md

# 環境変数ファイルをコピー
cp template.env .env

# .gitignoreを作成
# giboがインストールされているか確認
if ! command -v gibo &> /dev/null; then
    echo "giboがインストールされていません。インストールを開始します..."
    
    # Homebrewがインストールされているか確認
    if ! command -v brew &> /dev/null; then
        echo "Homebrewがインストールされていません。Homebrewをインストールします..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    
    # giboをインストール
    echo "giboをインストールしています..."
    brew install gibo
fi

gibo dump macos linux windows node > .gitignore

echo "セットアップ完了！"