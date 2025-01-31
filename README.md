## Setup Instructions

To set up your development environment, install the following dependencies:

### **1. Install Python & Virtual Environment Tools**

```bash
sudo apt install python3 python3-venv python3-pip
```

### **2. Install Node.js & npm**

```bash
sudo apt install nodejs npm
```

### **Small note**

You might run into some issues with <leader>sg (or "grep") in the fuzzy finder, because ripgrep isn't installed. If you find that <leader>sg is presenting errors, below.

```
sudo apt install ripgrep
```

### **3. Install Neovim (Updated Version)**

By default, WSL only installs up to Neovim 0.7.2, but you need version 0.9 or higher.  
Follow this tutorial by **Axlefublr** to install the most updated version:  
👉 [Watch the tutorial on YouTube](https://www.youtube.com/watch?v=2wapxsfzLho&ab_channel=Axlefublr%28she%5Cthey%29)

#### **Important Note**

The tutorial mostly works as shown, but if you install Neovim in the `.local/bin` folder (as the video suggests), you need to **add that folder to your PATH**.  
Otherwise, Neovim won't work.

To add it to your `PATH`, edit your `~/.bashrc` file:

```bash
nano ~/.bashrc
```

Then add the following line at the bottom:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

Save the file and apply the changes with:

```bash
source ~/.bashrc
```

### **3b. Install Neovim (Text Version)**

If you don't want to follow along with the video above, I have outlined the content in the video in text form.

1. Navigate to the Neovim GitHub releases section:
   [Neovim Releases](https://github.com/neovim/neovim/releases/)

2. Download `nvim-linux64.tar.gz` from the most recent release.

3. Move it to your desired location. The video moves it to `~/.local/bin/` (this is also where mine exists).

4. Extract the archive by running:

   ```bash
   tar xzvf nvim-linux64.tar.gz
   ```

   within this folder.

5. Create a symbolic link with:

   ```bash
   ln -s ./nvim-linux64/bin/nvim ./nvim
   ```

6. Assuming that you added the path in `~/.bashrc` earlier, you can now type `nvim` in any file to open Neovim.

## _Credits_

Credits to both \*_Henry Misc_ for a lot of this setup. I yanked a lot of his plugin configs before modifying them, though I'm sure some are still the same.
His video enabled me to setup my Neovim config before I was able to make my own (minor) modifications, and this would not be possible without him. Linked below are his Github and his Youtube where the video I followed along with originated from.

[Henry's Github](https://github.com/hendrikmi)

[Henry's Neovim Config Tutorial](https://www.youtube.com/watch?v=KYDG3AHgYEs&t=1569s&ab_channel=HenryMisc)
