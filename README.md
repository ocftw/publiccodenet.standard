# 《公共程式標準》

<!-- SPDX-License-Identifier: CC0-1.0 -->
<!-- SPDX-FileCopyrightText: 2025 Standard for Public Code Authors, https://www.standardforpubliccode.org/AUTHORS; 2019-2024 The Foundation for Public Code <info@publiccode.net>, https://www.standardforpubliccode.org/AUTHORS -->

《公共程式標準》提供公家機關一套準備開放原始碼解決方案的模型，讓他們能與其他地方相似的公家機關協作。
該標準包含給政策制定者、市行政官、開發人員與供應商的指引。

![version 0.8.1](assets/version-badge.svg)
[![License: CC0-1.0](https://img.shields.io/badge/License-CC0_1.0-lightgrey.svg)](http://creativecommons.org/publicdomain/zero/1.0/)
[![標準承諾](assets/standard-for-public-code-commitment.svg)](#help-improve-this-standard)

[![pages-build-deployment](https://github.com/standard-for-public-code/standard-for-public-code/actions/workflows/pages/pages-build-deployment/badge.svg)](https://github.com/standard-for-public-code/standard-for-public-code/actions/workflows/pages/pages-build-deployment)
[![測試](https://github.com/standard-for-public-code/standard-for-public-code/actions/workflows/test.yml/badge.svg)](https://github.com/standard-for-public-code/standard-for-public-code/actions/workflows/test.yml)

《公共程式標準》目前為草稿階段。
我們正在準備發行 1.0 版，
目前仍在幾個程式基底中作測試。

## 將《公共程式標準》套用到您的程式基底

若您想要將《公共程式標準》套用您的程式基底，就請放心去做，因為它是人人都能自由採用的開放標準。
如果您希望宣傳程式基底社群達成《公共程式標準》準則要求時的熱誠，請使用 [standard-for-public-code-commitment 徽章](assets/standard-for-public-code-commitment.svg)連結到這份承諾文件。
若要瞭解您程式基底所達成的程度，可以做[自我資格評估](https://publiccodenet.github.io/assessment-eligibility)；它能幫助您大略瞭解，如果想要滿足所有準則，還需要下多少功夫。

本標準 *應該* 足以自我解釋要如何套用到您的程式基底中。
若標準中有任何不明確的地方，我們鼓勵您在此開立議題，來讓我們能協助您以及其他與您抱持同樣看法的人。
如果需要一點靈感啟發，請參閱[社群製作的《實踐指引》](https://standard-for-public-code.github.io/community-implementation-guide-standard/)，其中包括範例與其他提示。

## 徵求貢獻

我們相信公共政策與公共軟體，應該具備涵容、好用、開放、易懂、課責、近用、永續等特質。
這代表我們需要一種新的方式，來設計、開發，以及付出心力育成原始碼和政策文件。

本標準為程式基底設立品質檢核水準，使其能滿足公家機關、社會機構、行政單位，以及其他重大基礎設施服務的需求。

本標準放在線上：[www.standardforpubliccode.org/](https://www.standardforpubliccode.org/)。
請參閱[`index.md`](index.md) 查看整體內容概覽。

## 幫忙改善這份標準 {#help-improve-this-standard}

我們正在尋找像您這樣的人，能對此專案做出[貢獻](CONTRIBUTING.md)，像是建議改善方向，以及協助開發等。😊
若要開始，請先參閱我們的[貢獻者指引](CONTRIBUTING.md)。
由於這是相當核心的文件，我們僅接受能帶來重大價值的貢獻。
[治理方式聲明](GOVERNANCE.md)中有說明管理該標準的方式。

請注意，本專案配合[行為守則](CODE_OF_CONDUCT.md)一同發行。
如果要參加本專案，代表您同意遵守守則。
請善待社群的所有其他成員。

## 預覽、建置、部署

儲存庫會建置一個靜態網站，並部署至 [www.standardforpubliccode.org/](https://www.standardforpubliccode.org/)。
網站採用 [GitHub 頁面](https://pages.github.com) 與 [Jekyll](https://jekyllrb.com/) 技術。

網站內容透過 [Jekyll](http://jekyllrb.com/) 技術建置。這代表您需要有安裝 ruby 與 ruby-bundler，例如：

```bash
sudo apt-get install -y ruby ruby-bundler ruby-dev
```

一旦安裝好 `ruby` 與 `bundle` 後，就可以執行 `bundle install`，接著再利用 `script/serve.sh` 命令稿轉譯呈現出網站成果。

```bash
bundle config set --local path 'vendor/bundle'
bundle install
```

After which the site can be rendered locally:

```bash
script/serve.sh
```

### 測試

本專案內含許多測試命令稿。
其中 `script/test-all.sh` 命令稿則統包執行所有本機測試。

請前往 [script](https://github.com/publiccodenet/standard/tree/main/script) 資料夾查看命令稿。

### 生成《公共程式標準》的 PDF 檔案

詳閱 [printing.md](docs/printing.md) 文件。

## 授權

© [作者與貢獻者](AUTHORS.md)

本標準採用 CC0 公眾領域貢獻宣告[給予授權](LICENSE)，該授權範圍涵蓋所有插圖與文件。
CC0 代表任何人都能任意使用這些內容。
如果您是貢獻者，代表您也將這些權利賦予他人。
若要進一步瞭解如何協助本專案，請參閱〈[貢獻指引](CONTRIBUTING.md)〉。

## 正體中文在地化程式庫說明

  * 本專案於 0.7.1 版前為數位部「開放原始碼軟體中文化」專案工作項目之一，由智新資通與開放文化基金會，號召臺灣 L10N.tw 社群協助貢獻，推動歷程詳細參考： [Wiki](https://github.com/moda-gov-tw/publiccodenet.standard/wiki)。
  * 0.8 版與 0.8.1 版後貢獻為「我國各級機關數位工具及公共程式調查研析及業務推動服務案後續擴充」專案工作項目之一，由勤業眾信與開放文化基金會號召臺灣社群持續更新。
本專案僅為推廣公共程式在地化運用，完整功能仍依[上游社群最新開發中專案](https://github.com/standard-for-public-code/standard-for-public-code/)為主。
    * 為了得以在台灣使用 PDF 產出功能，修改相關網頁樣式表與 .sh 檔案。
