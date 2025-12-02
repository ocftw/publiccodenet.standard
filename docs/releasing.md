# 發行新版本的《公共程式標準》

<!-- SPDX-License-Identifier: CC0-1.0 -->
<!-- SPDX-FileCopyrightText: 2025 Standard for Public Code Authors, https://www.standardforpubliccode.org/AUTHORS; 2021-2024 The Foundation for Public Code <info@publiccode.net>, https://www.standardforpubliccode.org/AUTHORS -->

This step-by-step guide walks through the process of preparing a release for Standard for Public Code, from reviewing the current state of the `develop` branch to sending the final files for print.
It should cover everything needed to ensure the release is properly updated, reviewed, and tagged.
This includes updating relevant documentation and publishing the release.
Additionally, it includes final tasks like preparing print materials and notifying translation contributors.

Releases are created by automation when triggered by tags pushed to the repository.
When the release branch is expected to be good enough to create a release, the maintainers first create and push a release candidate tag.
If the release artifacts created by the automation look good, then the maintainers create and push a release tag.

1. 審查「develop」分支的狀態
   - 確認預計收入該次發行版的所有變更都已完成合併
   - 邀請校對該分支目前的狀態
      - 如果有引入新的破折號，檢查是否能簡化文字並且移除破折號，例如改用較簡易的句子。如果需要用到複雜的句子，檢查是否能用其他標點符號來取代破折號。如果破折號最適合用來表達該句子的涵義，則請遵守《[芝加哥格式手冊](https://en.wikipedia.org/wiki/Dash#En_dash_versus_em_dash)》的規範。
2. 建立發行用分支
   - 從「develop」分支下命令，`git switch -c "release-$MAJOR.$MINOR.$PATCH"`
   - 推送分支，`git push -u origin release-$MAJOR.$MINOR.$PATCH`
   - Open a DRAFT pull request from the new branch in to main so that others can easily review, discuss, and add commits to the branch
3. 更新本次新發行
   - [ ] 在 [`AUTHORS.md`](../AUTHORS.md) 中加入新貢獻者的資料
   - [ ] 更新 [`RELEASE_NOTES.md`](../RELEASE_NOTES.md)
     - Create the first second-level header with the form `## Version X.Y.Z` where `X.Y.Z` is equal to this release's `$MAJOR.$MINOR.$PATCH` values. This form allows `script/release-body.sh` to extract this version's release notes.
     - Instead of putting a date, put the text `DATE-OF-RELEASE` as this will be updated by `script/update-release-notes-date.sh`
   - [ ] 更新 [`roadmap.md`](roadmap.md)
     - If making any changes to the file, update `Last updated` date to be today's date
   - [ ] 透過 diff 進行額外傳輸到「main」分支
     - 執行 `script/generate-review-template.sh` 並送交更新後的 `docs/review-template.html` 版次紀錄
     - 使用審查範本中的新文字來更新 `docs/standard-for-public-code.html`，會將任何狀態變更作為結果更新
       - see [assessment-update.md](./assessment-update.md) for guidance on how to use `git diff` and `patch` to make this step easier and less error-prone
     - 重新檢查用字有變更的任何小節或段落，確保變更的字詞適合該整體內容，並且沒有文法或拼字錯誤
     - 確認有安裝字型「Mulish」，請參見 `script/ensure-font.sh`
     - 使用 `script/pdf.sh rc1` 檢查轉譯出的 `.pdf` 檔
       - 確認沒有連結相衝的問題
       - 檢查文字分頁之處，可能需要移除或新增 CSS 分頁語法，例如：`<p style="page-break-after: always;"></p>`
     - 如果有需要，送交修正版次，並重複進行額外傳輸
   - [ ] 推送分支，與「main」分支比較，範例：`https://github.com/standard-for-public-code/standard-for-public-code/compare/main...release-$MAJOR.$MINOR.$PATCH`
     - 請多位審查人員（特別是校對人員）進行審查
     - 審查人員若發現不會阻礙發行的缺失，則會建立議題
     - 如果是發行所需處理的缺失，審查人員可以提交拉取請求來解決問題
     - 若有額外的拉取請求合併至發行分支，則再次請求審查
   - [ ] 執行 `to-archive-org.sh` 命令稿
     - Ensure the `urlencode` command is in the `PATH`
       - On Debian-like systems, `sudo apt-get install gridsite-clients`
       - See also: [man page for gridsite-clients urlencode](https://manpages.debian.org/testing/gridsite-clients/urlencode.1.en.html)
     - Run `script/to-archive-org.sh`
       - Takes 30 to 45 minutes to complete because of rate throttling
4. 在 GitHub 上發行，附上發行備註與版本編號
   - [ ] `git tag trigger-$MAJOR.$MINOR.$PATCH-rc1`
   - [ ] `git push --tags`（詳見 `../.github/workflows/release-on-tag.yml`）
   - [ ] 移除本地端的 tag 標記：`git tag -d trigger-$MAJOR.$MINOR.$PATCH-rc1`
   - [ ] Review the release candidate artifacts
     - If needed, fix and create another `-rcX` release, incrementing the release candidate number
     - Else the latest release candidate is determined to be of sufficient quality, proceed to create the release
5. Create GitHub release with the release notes and version number
   - [ ] `git tag trigger-$MAJOR.$MINOR.$PATCH`
   - [ ] `git push --tags`（see: `../.github/workflows/release-on-tag.yml`）；this will close the DRAFT pull request
   - [ ] delete local tag: `git tag -d trigger-$MAJOR.$MINOR.$PATCH`
6. [將檔案傳送給印刷廠商印刷](printing.md)
   - [ ] 封面檔案：`standard-cover-$MAJOR.$MINOR.$PATCH.pdf`
   - [ ] 內頁 PDF：`standard-for-public-code-print-$MAJOR.$MINOR.$PATCH.pdf`
   - [ ] Folded checklist：`standard-checklist-folded-$MAJOR.$MINOR.$PATCH.pdf`
7. 通知[翻譯](https://github.com/publiccodenet/community-translations-standard)貢獻者
