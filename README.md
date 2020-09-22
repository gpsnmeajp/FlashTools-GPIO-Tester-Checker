# FlashTools-GPIO-Tester-Checker
FlashTools GPIO Tester & Checker  
FlashAirは、簡単にIOポートを操作できる機能を持ちながら、  
それをWebインターフェースから用意に取り扱える機能はありませんでした。  
  
というわけで、PCやスマートフォンから、手軽に入出力状態を変更・確認できるツールを作成しました。  
※FlashTools Lua Editorに同梱しているものと同等のものです。  
    
Lua機能を使っていないため、W-02でもW-03でも利用できます。  
English available.  
  
使い方は、IO_TEST.zipを解凍し、中に入っているIO_TEST.htmおよびsetup.luaを  
FlashAirにコピー。  
FlashAirにWi-Fiで接続し、IO_TEST.htmを開くだけ。  
(PC上で直接、IO_TEST.htmを開かぬようご注意ください)  
  
W-03の場合、CONFIG(IFMODE)の設定も、ワンタッチで行えます。  
(W-02の場合は、手動で編集してください。)  
ピン対応表 [Pin Assignment]  

|Pin|fa.pio|pioduino|SD|SD Pin|Airio|MTO-EV101|AirioRP|SPI-1|SPI-2|AKI K-05818|fa.spi|
|----|----|----|----|----|----|----|----|----|----|----|----| 
|PIN 0|0x01|0|CMD|2|SW1|MISO|CMD|DI|MOSI|SDI|MOSI(out)|
|PIN 1|0x02|1|DAT0|7|Red|MOSI|DAT0|DO|MISO|SDO|SCLK(out)|
|PIN 2|0x04|2|DAT1|8|Blue|DAT1|DAT1|DAT1|NC|DAT1(↓NC)|/SS(out)|
|PIN 3|0x08|3|DAT2|9|Green|DAT2|DAT2|DAT2|NC|DAT2(↑NC)|MISO(in)|
|PIN 4|0x10|4|CD/DAT3|1|NC|CS|DAT3|CS|CS|CS|INT(in)|
  
本ソフトウェアは、東芝およびフィックスターズの公式ソフトウェアではありません  
  
お問い合せは、@Seg_faulまでお願いします。  
AE-FAIO版:秋月「FlashAir DIP IOボードキット」用のバージョンは**IO_TEST_FAIO.zip**  

＊更新履歴  
v0.1 初公開  
  
v0.2 出力ラグの原因となっている自動更新を停止できるようにチェックボックス追加  
　　　全項目に拙い英語併記。  
  
v0.3 ピンアサインを増やした。(AirioRP、fa.spiに対応、他修正など)  
v0.31 ピンアサインのミス修正  
  
※Windows DefenderがZip圧縮されたjsファイルを誤検出してトロイの木馬扱いしますが、  
　他のウィルス対策ソフト及び、オンラインマルチスキャンではウィルスを検出しないことを確認しています。  
　Windows Defenderをお使いの方は、解凍し、SDカード上にコピーするまで、一時的に無効にして使用してください。  
　(解凍後は誤検出は発生しないようです)  
  
