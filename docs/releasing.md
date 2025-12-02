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
2. 建立發行分支
    - 從「develop」分支建立，執行：`git switch -c "release-$MAJOR.$MINOR.$PATCH"`
    - 推送分支：`git push -u origin release-$MAJOR.$MINOR.$PATCH`
    - 建立一個從新分支到 main 的 *DRAFT* Pull Request，方便他人進行早期審查、討論與提交額外 commit
3. 更新本次新版本的內容
    - [ ] 在 [`AUTHORS.md`](../AUTHORS.md) 中加入新貢獻者
    - [ ] 更新 [`RELEASE_NOTES.md`](../RELEASE_NOTES.md)
        - 建立本版本的第二層標題：`## Version X.Y.Z`（使用 `$MAJOR.$MINOR.$PATCH`）
        - 日期欄位先填入 `DATE-OF-RELEASE`（會由 script 更新）
    - [ ] 更新 [`roadmap.md`](roadmap.md)
        - 若有修改內容，請更新「Last updated」日期
    - [ ] 執行 main 分支需同步的 diff
        - 執行 `script/generate-review-template.sh`，提交更新後的 `docs/review-template.html`
        - 使用審查範本內容更新 `docs/standard-for-public-code.html`
            - 參考：[assessment-update.md](./assessment-update.md)
        - 檢查變動小節的用字是否一致、語法是否正確
        - 確認已安裝字型 **Mulish**（見 `script/ensure-font.sh`）
        - 使用 `script/pdf.sh rc1` 檢查輸出的 `.pdf`
            - 確認無連結衝突
            - 檢查分頁，必要時調整 `<p style="page-break-after: always;"></p>`
        - 若需修正，則提交更新並重複此流程
    - [ ] 推送分支，並在 GitHub 上比較：
        - 範例：`https://github.com/.../compare/main...release-$MAJOR.$MINOR.$PATCH`
        - 請多位審查人員（尤其校對者）協助審查
        - 若發現不阻礙發行的問題，建立 issue 記錄
        - 若有必須修的問題，請提交 PR 到發行分支
        - 若發行分支合併了新 PR，需重新請求審查
    - [ ] 執行 `script/to-archive-org.sh`
        - 需確保 `urlencode` 在 PATH 中
            - Debian 可安裝：`sudo apt-get install gridsite-clients`
            - 完整說明見 urlencode man page
        - 執行 `script/to-archive-org.sh`（約 30–45 分鐘，因速率限制）
4. 在 GitHub 上建立 release tag
    - [ ] `git tag trigger-$MAJOR.$MINOR.$PATCH-rc1`
    - [ ] `git push --tags`
    - [ ] 本地刪除 tag：`git tag -d trigger-$MAJOR.$MINOR.$PATCH-rc1`
    - 審查 release artifacts：
        - 若需修正，建立新的 `rcX` 並遞增編號
        - 若品質足夠，即可建立正式版本
5. 建立 GitHub Release
    - [ ] `git tag trigger-$MAJOR.$MINOR.$PATCH`
    - [ ] `git push --tags`
    - [ ] 刪除本地 tag：`git tag -d trigger-$MAJOR.$MINOR.$PATCH`
6. 送交內容給印刷廠商
    - [ ] 封面：`standard-cover-$MAJOR.$MINOR.$PATCH.pdf`
    - [ ] 內頁 PDF：`standard-for-public-code-print-$MAJOR.$MINOR.$PATCH.pdf`
    - [ ] 摺頁清單：`standard-checklist-folded-$MAJOR.$MINOR.$PATCH.pdf`
7. 通知[翻譯](https://github.com/publiccodenet/community-translations-standard)貢獻者
