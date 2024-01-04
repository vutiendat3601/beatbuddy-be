file=$1
base_name=$(basename "$1")
name_without_ext=${base_name%.*}
echo "$name_without_ext"
hash_md5="$(echo -n "$name_without_ext" | md5sum)"
hash_md5=${hash_md5:0:32}
echo "hash_md5: $hash_md5"
mkdir $hash_md5
ffmpeg -i $file -vn -acodec mp3 -hls_time 3 -b:a 128k -hls_key_info_file mp3segmentkey.info -hls_playlist_type vod -f hls -hls_segment_filename "${hash_md5}/${hash_md5}_seq%03d.ts" "${hash_md5}/${hash_md5}.m3u8"