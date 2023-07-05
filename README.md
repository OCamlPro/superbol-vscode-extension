# Superbol VSCode Platform for COBOL

## Features

* LSP (superbol) with following capabilities:
    * Syntax diagnostics
    * Go to definitions
    * Find references
    * Peek on copybook (Superbol PR #211)
    * Semantic highlighting (Superbol PR #212)
    * File and range indentation

## Install

### From binary and VSIX

Get the `superbol` executable and install it in `/usr/local/bin`.

Get the `superbol-vscode-platform.vsix` file from the releases.

In VSCode open the `extension` view and select the three dots on the top right of the sidebar.

Select `Install from VSIX ...` and select the `superbol-vscode-platform.vsix` file.

### Build

Get the `superbol` executable and install it in `/usr/local/bin`.

Clone the source code of this extension:
```bash
git clone https://github.com/OCamlPro/superbol-vscode-platform.git
```

Go to the created folder and install the dependencies with
```bash
cd superbol-vscode-platform
yarn install
```

Finally build the extension with:
```bash
drom build
make compile
yarn package
```

### Add the extension to VSCode

Open VSCode and go to the extension view.

In the sidebar click on the three dots on the top right (just above `search`) and select
`install from VSIX ...` and select the `superbol-vscode-platform.vsix` generated from
this extension.

### Configure the extension

If you have installed the `superbol` executable in `/usr/local/bin` then you have nothing to do,
the extension will work out of the box.

Otherwise get the path to the `superbol` executable and copy it.

Go to your VSCode settings and in the extension submenu select `Superbol COBOL`.

In the `superbol` field past the path to the `superbol` executable.

You can check the documentation on using the extension on [this page](https://ocamlpro.github.io/superbol-vscode-platform/sphinx).

### GNU/Emacs mode

* An experimental mode for GNU/Emacs, that is based on [lsp-mode](https://github.com/emacs-lsp/lsp-mode), is provided. It can be tested via the following commands:

```shell
# Derive customization variables from "package.json"
make emacs/lsp-superbol-customs.el
# Setup path to superbol directory, where the "padbol" executable can be found
export SUPERBOL_DIR="$HOME/work/repos/superbol";
# Launch an Emacs with LSP-mode autoloads and superbol-mode triggered for default COBOL file extensions
\emacs -q -L emacs --load superbol-mode --load lsp-mode-autoloads --eval "(custom-set-variables '(lsp-superbol-path \"$SUPERBOL_DIR\"))" --funcall superbol-mode-for-default-extensions
# Then visit a COBOL file and have fun
```

## Resources

* Website: https://ocamlpro.github.io/superbol-vscode-platform
* General Documentation: https://ocamlpro.github.io/superbol-vscode-platform/sphinx
* Sources: https://github.com/ocamlpro/superbol-vscode-platform


