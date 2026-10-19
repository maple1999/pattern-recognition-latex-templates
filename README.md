# Pattern Recognition LaTeX Templates

从实际 Pattern Recognition 投稿项目中提取的可复用模板，包含论文、修订标红稿和逐条回复信。保留原项目排版设置，内容已替换为通用占位示例。这是非官方模板，不代表期刊最新投稿要求。

## 文件

| 文件 | 用途 |
| --- | --- |
| `manuscript.tex` | 普通论文模板：Elsevier `elsarticle`、review 单栏模式、数字引用、每 5 行显示行号 |
| `manuscript-marked.tex` | 相同正文的标红版本，附 red-only `DIF` 宏和红色示例 |
| `response-letter.tex` | 回复信：修改摘要、编辑与各审稿人逐条 Comment / Response / Changes made |
| `references.bib` | 虚构参考文献占位示例，投稿前必须替换 |
| `output/pdf/` | 三份已编译的 PDF 示例 |
| `build.ps1` | Windows PowerShell 一键编译脚本 |

## 编译

使用包含 `elsarticle`、`elsarticle-num` 和相应宏包的 TeX Live 或 MiKTeX。保留项目使用的数学、算法、子图、表格、浮动体与超链接宏包。运行：

```powershell
powershell -ExecutionPolicy Bypass -File ./build.ps1
```

也可以在本目录依次执行（标红稿将 `manuscript` 换成 `manuscript-marked`）：

```sh
pdflatex -interaction=nonstopmode -halt-on-error manuscript.tex
bibtex manuscript
pdflatex -interaction=nonstopmode -halt-on-error manuscript.tex
pdflatex -interaction=nonstopmode -halt-on-error manuscript.tex
pdflatex -interaction=nonstopmode -halt-on-error response-letter.tex
pdflatex -interaction=nonstopmode -halt-on-error response-letter.tex
```

Overleaf：上传仓库源文件，编译器选择 pdfLaTeX，按需将上述三个 `.tex` 文件之一设为 Main document。

## 标红用法

```tex
Unchanged text. \DIFadd{New or revised text.}
\DIFdel{Deleted text is hidden in the PDF.}
```

`\DIFaddFL` 可用于浮动体中的文字。`\DIFaddbegin` / `\DIFaddend` 仅是兼容标记，本身不改变颜色；新增文字需要放入 `\DIFadd{...}`。整段可使用 `{\color{red} ...}`，不要将整个浮动体环境塞入 `\DIFadd`。

普通稿和标红稿为独立文件；修改时同步正文，确保差别仅为标红。该仓库不自动生成差异，也不展示被删除的内容。

## 使用前替换

- 论文标题、作者、机构、邮箱、摘要、关键词及全部正文。
- 图表占位内容、虚构参考文献、贡献声明、利益冲突、基金及数据代码可用性说明。
- 回复信稿件编号、原始审稿意见、真实回复与修改位置。
- 根据本次投稿要求确认页数、匿名处理、行距和声明；不将原项目的具体限制作为通用要求。

## 提取来源与调整

- 论文排版来源：原项目 `elsarticle-paper.tex`。
- 标红宏来源：原项目 `elsarticle-paper-revise-marked.tex`。
- 回复信排版来源：原项目 `response_twcrac_R2.tex`。
- 保留论文的类选项、宏包、浮动体设置和参考文献样式，以及回复信的 12pt 字号、页边距和 1.2 行距设置。
- 回复信移除强制 `dvips` 颜色驱动以兼容 pdfLaTeX，设置空作者并调整标题后间距。
- 未收录原论文内容、实验结果、真实作者信息、原审稿意见或投稿附件。

论文模板保留来源文件中的 Elsevier / LPPL 声明；修改后的文件使用新名称。`elsarticle` 类和参考文献样式由 TeX 发行版提供，本仓库不重新分发它们。各第三方组件遵循其原有许可。
