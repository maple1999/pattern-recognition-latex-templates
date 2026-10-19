# Pattern Recognition LaTeX Templates

用于 Pattern Recognition 论文投稿与修订的 LaTeX 模板，包含普通论文、修订标红稿和逐条回复信。提供通用占位示例、PDF 预览和编译脚本，可直接替换内容使用。

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

使用包含 `elsarticle`、`elsarticle-num` 和相应宏包的 TeX Live 或 MiKTeX。模板支持数学公式、算法、子图、表格和超链接。运行：

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
- 根据本次投稿要求确认页数、匿名处理、行距和声明。

## 模板排版与兼容性

- 论文使用 Elsevier `elsarticle` 审稿排版。
- 标红稿提供兼容 `DIF` 命令的红色修订标记。
- 回复信使用独立的 `article` 文档，可按需增删审稿人和回复条目。
- 回复信使用 12pt 字号和 1.2 倍行距。
- 三份模板均使用 pdfLaTeX 编译。

`elsarticle` 类和参考文献样式由 TeX 发行版提供，各第三方组件遵循其相应许可。
