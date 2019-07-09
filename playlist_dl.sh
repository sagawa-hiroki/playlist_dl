#!/bin/bash

# usage
# /bin/bash ./playlist_dl.sh ./playlist_dl.txt ./download_datas/youtube_playlist

# cron で実行すると ffmpeg にパスが通っていないと怒られる事があるので宣言しています
PATH=${PATH}:/usr/local/bin

# YouTube のプレイリストのURLなどが記述しているテキストファイル
PLAYLIST_FILE=$1

# 動画(音声)をダウンロードする場所
DOWNLOAD_BASE_DIR=$2

# ファイル存在チェック
if [ ! -e ${PLAYLIST_FILE} ]
then
  echo 'ERROR : prease create play list file "'${PLAYLIST_FILE}'"'
  exit
fi

# ディレクトリ存在チェック
if [ ! -e ${DOWNLOAD_BASE_DIR} ]
then
  echo 'ERROR : prease create dir "'${DOWNLOAD_BASE_DIR}'"'
  exit
fi

while read line
do
  lines=(`echo ${line}`)    # 配列に変換
  channel_type=${lines[0]}  # チャンネルタイプ : sound_only, movie
  contents_name=${lines[1]} # 番組名など
  playlist_url=${lines[2]}  # youtubeのプレイリストURL

  download_dir=${DOWNLOAD_BASE_DIR}/${channel_type}/${contents_name}

  # ディレクトリ作成
  if [ ! -e ${download_dir} ]
  then
    mkdir -p ${download_dir}
  fi

  pushd ${download_dir}
    if [ ${channel_type} = 'sound_only' ]
    then
      # -i : プレイリストに入っている動画に削除されたものがあってもエラーにならずそのまま続行する
      # -x : 音のみを抽出する
      /usr/local/bin/youtube-dl \
        --download-archive __${contents_name}.txt \
        -i \
        -x \
        --audio-format mp3 \
        ${playlist_url}
    else
      /usr/local/bin/youtube-dl \
        --download-archive __${contents_name}.txt \
        -i \
        -f mp4 \
        ${playlist_url}
    fi
  popd
done < ${PLAYLIST_FILE}
