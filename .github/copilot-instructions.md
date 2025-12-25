# Copilot Instructions

When performing a code review, respond in Japanese.

## このドキュメントについて

このファイルは、GitHub Copilot がプロジェクト固有のコンテキストを理解し、適切なコード提案を行うためのガイドラインを定義します。プロジェクト開始時に各セクションを埋め、プロジェクトの進化に合わせて更新してください。
ファイルが大きくなる場合、`.github/instructions/*.instructions.md` に分割して記載することも可能です。

---

## プロジェクト概要

### プロジェクト名

[プロジェクト名]

### プロジェクトの説明

[プロジェクトの目的、解決する課題、主なユースケースを記述]

### 対象ユーザー

[想定するユーザー層やペルソナを記述]

### ビジネス要件

[重要なビジネス要件や制約事項を記述]

---

## 技術スタック

### 言語・ランタイム

- メイン言語: [例: TypeScript 5.x]
- ランタイム: [例: Node.js 20.x LTS]
- パッケージマネージャー: [例: npm / pnpm / yarn]

### フレームワーク・ライブラリ

- フロントエンド: [例: React 18.x, Next.js 14.x]
- バックエンド: [例: Express.js, Fastify]
- データベース: [例: PostgreSQL 15.x, MongoDB]
- ORM/ODM: [例: Prisma, TypeORM]

### 開発ツール

- フォーマッター: [例: Prettier]
- リンター: [例: ESLint]
- 型チェック: [例: TypeScript Strict Mode]
- バンドラー: [例: Vite, Webpack]
- テストフレームワーク: [例: Vitest, Jest, Playwright]

### インフラ・デプロイ

- ホスティング: [例: Vercel, AWS, Azure]
- CI/CD: [例: GitHub Actions]
- コンテナ: [例: Docker, Docker Compose]
- モニタリング: [例: Sentry, DataDog]

---

## プロジェクト構成

### ディレクトリ構造

```
project-root/
├── src/
│   ├── components/     # UIコンポーネント
│   ├── hooks/         # カスタムフック
│   ├── utils/         # ユーティリティ関数
│   ├── types/         # 型定義
│   ├── services/      # API通信・ビジネスロジック
│   ├── stores/        # 状態管理
│   └── constants/     # 定数定義
├── tests/             # テストファイル
├── docs/              # ドキュメント
└── scripts/           # ビルド・デプロイスクリプト
```

### 主要ディレクトリの役割

- **src/**: [各ディレクトリの役割を記述]
- **tests/**: [テスト戦略とディレクトリ構成を記述]
- **docs/**: [ドキュメントの種類と管理方針を記述]

---

## コーディング規約

### 命名規則

- **ファイル名**: [例: kebab-case.ts, PascalCase.tsx]
- **変数・関数**: [例: camelCase]
- **クラス**: [例: PascalCase]
- **定数**: [例: UPPER_SNAKE_CASE]
- **型・インターフェース**: [例: PascalCase, 接頭辞 I は使用しない]
- **コンポーネント**: [例: PascalCase.tsx]
- **フック**: [例: useCamelCase]

### コードスタイル

#### インポート順序

```typescript
// 1. 外部ライブラリ
import React from "react";
import { useState } from "react";

// 2. 内部モジュール（絶対パス）
import { Button } from "@/components/Button";
import { useAuth } from "@/hooks/useAuth";

// 3. 相対パス
import { helper } from "./helper";

// 4. 型定義
import type { User } from "@/types";

// 5. スタイル
import styles from "./styles.module.css";
```

#### 関数定義

- [例: アロー関数を優先、必要に応じて function キーワードを使用]
- [例: エクスポートする関数には JSDoc コメントを必須とする]

#### コメント

- [例: 複雑なロジックには必ずコメントを付ける]
- [例: TODO/FIXME コメントは Issue 番号とともに記載]

### 型定義

- [例: any は禁止、unknown を使用]
- [例: 型ガードを積極的に使用]
- [例: ジェネリクスは明示的な名前を使用（T, U, V ではなく TData, TError など）]

---

## アーキテクチャ指針

### 設計原則

- [例: Single Responsibility Principle を遵守]
- [例: DRY（Don't Repeat Yourself）を心がける]
- [例: KISS（Keep It Simple, Stupid）を優先]
- [例: 早期リターンを使用して、ネストを減らす]

### コンポーネント設計（フロントエンド）

#### コンポーネント分類

- **Pages**: [ルーティングに対応するページコンポーネント]
- **Features**: [機能単位のコンポーネント群]
- **Components**: [共通 UI コンポーネント]

#### コンポーネント設計原則

- [例: Presentational と Container を分離]
- [例: 1 コンポーネント 1 ファイル、最大 300 行を目安]
- [例: Props は interface で明示的に定義]

### 状態管理

- **グローバル状態**: [例: Zustand, Redux, Context API]
- **サーバー状態**: [例: TanStack Query, SWR]
- **フォーム状態**: [例: React Hook Form, Formik]
- **URL 状態**: [例: Next.js Router, React Router]

### データフロー

```
[ユーザー操作] → [イベントハンドラー] → [状態更新/API呼び出し]
    ↓
[状態変更] → [コンポーネント再レンダリング] → [UI更新]
```

---

## API 通信とデータ管理

### API クライアント

- [例: axios / fetch を使用]
- [例: 全ての API リクエストは services/ ディレクトリに集約]
- [例: エラーハンドリングは共通のインターセプターで処理]

### 認証・認可

- [例: JWT トークンを使用]
- [例: トークンは httpOnly Cookie に保存]
- [例: リフレッシュトークンによる自動更新]

### エラーハンドリング

- [例: API エラーは Error クラスを継承したカスタムエラーで処理]
- [例: ユーザーに表示するエラーメッセージは i18n 対応]

---

## テスト戦略

### 単体テスト（Unit Tests）

- **対象**: ユーティリティ関数、カスタムフック、ビジネスロジック
- **ツール**: [例: Vitest, Jest]
- **カバレッジ目標**: [例: 80%以上]
- **命名**: `*.test.ts` or `*.spec.ts`

### コンポーネントテスト（Component Tests）

- **対象**: React コンポーネント
- **ツール**: [例: Testing Library, Vitest]
- **方針**: [例: ユーザー操作をシミュレートし、DOM の変化を検証]

### インテグレーションテスト（Integration Tests）

- **対象**: API エンドポイント、複数モジュールの連携
- **ツール**: [例: Supertest, MSW]

### E2E テスト（End-to-End Tests）

- **対象**: クリティカルなユーザーフロー
- **ツール**: [例: Playwright, Cypress]
- **実行タイミング**: [例: PR マージ前、リリース前]

### テスト実行

```bash
# 単体・コンポーネントテスト
npm run test

# E2Eテスト
npm run test:e2e

# カバレッジ計測
npm run test:coverage
```

---

## パフォーマンス最適化

### フロントエンド

- [例: React.memo / useMemo / useCallback を適切に使用]
- [例: 画像は next/image で最適化]
- [例: コード分割を活用]
- [例: Lighthouse スコア 90 以上を目標]

### バックエンド

- [例: データベースクエリは N+1 問題を回避]
- [例: キャッシュを適切に使用（Redis など）]
- [例: API レスポンスは gzip 圧縮]

---

## セキュリティ

### 基本方針

- [例: OWASP Top 10 を遵守]
- [例: 依存パッケージは定期的に更新（npm audit）]
- [例: 環境変数に機密情報を保存し、コミットしない]

### 主な対策

- **XSS 対策**: [例: ユーザー入力は常にサニタイズ]
- **CSRF 対策**: [例: CSRF トークンを使用]
- **SQL インジェクション対策**: [例: ORM のパラメーター化クエリを使用]
- **認証**: [例: パスワードは bcrypt でハッシュ化]

---

## アクセシビリティ（a11y）

- [例: WCAG 2.1 AA レベルを目標]
- [例: セマンティック HTML を使用]
- [例: aria-label / aria-describedby を適切に使用]
- [例: キーボード操作をサポート]
- [例: スクリーンリーダーでテスト]

---

## 国際化（i18n）

- [例: next-i18next / react-i18next を使用]
- [例: 翻訳ファイルは locales/ ディレクトリに配置]
- [例: 日付・通貨フォーマットは Intl API を使用]

---

## ビルドとデプロイ

### ローカル開発

```bash
# 開発サーバー起動
npm run dev

# ビルド
npm run build

# 本番環境プレビュー
npm run start
```

### デプロイフロー

1. [例: feature ブランチで開発]
2. [例: PR 作成時に自動テスト実行]
3. [例: main マージ後、自動デプロイ]

### 環境変数

- `.env.local`: ローカル開発環境
- `.env.development`: 開発環境
- `.env.staging`: ステージング環境
- `.env.production`: 本番環境

---

## ドキュメント管理

### 必須ドキュメント

- **README.md**: プロジェクト概要、セットアップ手順
- **CHANGELOG.md**: バージョン履歴
- **CONTRIBUTING.md**: コントリビューションガイド
- **API 仕様**: [例: OpenAPI / Swagger]

### ドキュメント更新ルール

- [例: 新機能追加時は必ずドキュメント更新]
- [例: API 変更時は仕様書を先に更新]

---

## その他の重要事項

### Git コミット規約

```
type(scope): subject

[optional body]

[optional footer]
```

**Type**:

- `feat`: 新機能
- `fix`: バグ修正
- `docs`: ドキュメント変更
- `style`: コードスタイル修正
- `refactor`: リファクタリング
- `test`: テスト追加・修正
- `chore`: ビルドプロセスや補助ツールの変更

### ブランチ戦略

- `main`: 本番環境
- `develop`: 開発環境
- `feature/*`: 機能開発
- `hotfix/*`: 緊急バグ修正

### レビュー方針

コードレビューの際は以下を重視してください:

- セキュリティの問題
- ロジックエラー
- コードの可読性
- [例: 全ての PR は最低 1 人のレビューが必要]
- [例: 重要な変更は 2 人以上のレビューが必要]
- [例: レビューコメントは建設的に]

---

## 参考リンク

- [プロジェクトリポジトリ]: [URL]
- [デザインシステム]: [URL]
- [API ドキュメント]: [URL]
- [社内ガイドライン]: [URL]
