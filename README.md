# playlist_dl

### できる事
- YouTubeのプレイリストをローカルに保存する事ができる
  - `playlist_dl.txt` に登録するときに音声のみを抽出する設定もできる

### 1. YouTubeに登録、プレイリスト作成
- [YouTube](https://youtube.com)

### 2. youtube_dlインストール

- [youtube_dl download](https://ytdl-org.github.io/youtube-dl/download.html)
  - Mac だったら `brew install youtube_dl` でいけます

### 3. playlist_dl.txtを作成
- `playlist_dl.txt` (名前は変更可能) を任意の場所に設置

#### playlist_dl.txt 記法
- スペース区切りで以下のようなフォーマットで記入
- [動画タイプ] [ダウンロードする時のディレクトリ名] [プレイリストURL]
  - 動画タイプ
    - movie : 動画
    - sound_only : 動画から音声のみ抽出
```bash
# 注) 実際の playlist_dl.txt はコメントアウトは使えません

# 例) 動画プレイリスト
movie movie_list https://www.youtube.com/watch?list=xxxxxxxxxxxx

# 例) 音声のみプレイリスト
sound_only sound_only_list https://www.youtube.com/watch?list=yyyyyyyyyy
```

### 4. コマンド実行
```bash
# clone
git clone https://github.com/sagawa-hiroki/playlist_dl.git

# /bin/bash ./playlist_dl.sh playlist_dl.txt [動画をダウンロードするカレントディレクトリ]
$ /bin/bash playlist_dl.sh playlist_dl.txt download_datas/youtube_playlist
```
