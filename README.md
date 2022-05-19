# 🍏📁 macOS GitHub Folder Icon

Made so that it fits nicely alongside all the others inside your home directory... or wherever.

What you get:

- ... 📈 A version available all the way from Mac OS X 10.5 (Leopard) through to macOS 12 (Monterey), see the `icons` folder
- ... 🌗 Light and Dark mode variants (where applicable, macOS 11 or later)
- ... 📁 Both `icns` and `iconset` versions of all icons
- ... 🖼️ All icon sizes from `16x16` through to `512x512@2x`

<p align="middle">
  <img src="art/preview_old.png" width="40%" alt="the oldest Mac OS X icon" />
  <img src="art/preview_new.png" width="40%" alt="the newest macOS icon" />
</p>

## 🧰 Installing dependencies

I used to manually find and extract the folder icon upon every release, but someone recently introduced me to... [Folderify](https://github.com/lgarron/folderify)! Which has made maintaining this repo a breeze.

Make sure [`brew`](https://brew.sh/) is installed (don't want to automate installing this on your system) and then go ahead and run the `make` command to get things setup:

```sh
make install
```

## 🏗️ Generating icons

This is as simple as ensuring that you've already run `make install` and then running:

```sh
make icons
```

### 🎨️ Manually generating just the icons

To generate just the icons on their own, run:

```sh
make generate
```

### 🖼️ Manually generating a new preview image

To generate a new preview image, used in the README of this project, run:

```sh
make preview
```

### 🗑️ Manually cleaning Icons

If you want to quickly wipe the slate clean, run:

```sh
make clean
```

Although this step is run prior to generating new icons anyway.

## ❓ F.A.Q's

- Can I get the icon to automatically change with light/dark mode?

  - Unfortunately, no. As mentioned in the [Folderify README, under Usage](https://github.com/lgarron/folderify#usage):

    > There is currently no simple way to set an icon that will automatically switch between light and dark when you switch the entire OS. You can only assign one icon to a folder.

  - This appears to be a limitation within macOS itself and Apple currently not allowing for the distinction between two icons

## 🎂 Sources

- Amazing GitHub icon: [Dave Gandy on flaticon](https://www.flaticon.com/free-icon/github-logo_25231)
- Superb icon generation: [Folderify](https://github.com/lgarron/folderify)
- Fabulous macOS package manager: [`brew`](https://brew.sh/)
