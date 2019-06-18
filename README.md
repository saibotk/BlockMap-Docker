# BlockMap-Docker [![](https://images.microbadger.com/badges/version/saibotk/blockmap.svg)](https://hub.docker.com/r/saibotk/blockmap/) [![](https://images.microbadger.com/badges/image/saibotk/blockmap.svg)](https://hub.docker.com/r/saibotk/blockmap/) [![](https://img.shields.io/docker/pulls/saibotk/blockmap.svg?maxAge=600)](https://hub.docker.com/r/saibotk/blockmap/)

*Available tags:*
* `latest` - most up-to-date version (can be **unstable**!).
* `x.x.x` - a specific version.

# What is BlockMap?

BlockMap is a Mincraft map renderer written in Java, which is able to render 1.13+ worlds.  
Go check out the amazing project for yourself at [Minecraft-Technik-Wiki/BlockMap](https://github.com/Minecraft-Technik-Wiki/BlockMap).

# What does this container do?

This image can be used to render a Minecraft map, by just mounting the world folder and an output folder. The container will execute the render tasks and after that it will stop. If you want to automatically render maps every now and then, you can achieve this by using a cronjob or systemd etc..

# Usage

### Quick Start

*Please **replace the paths** on the left side with your own!*  
*They should all point to a directory, where the region files are located (files like **r.0.0.mca**) or if you want all data to be processed, the parent folder (usually where the 'region') folder lives in.*

```
sudo docker run -d \
	-v /MY-MINECRAFT-PATH/world/:/blockmap/input/overworld/ \
	-v /MY-MINECRAFT-PATH/world_nether/:/blockmap/input/nether/ \
	-v /MY-MINECRAFT-PATH/world_the_end/:/blockmap/input/end/ \ 
	-v /MY-OUTPUT-PATH/output:/opt/blockmap/output \
	--name blockmap \
	saibotk/blockmap
```

### BlockMap + Nginx setup

*Coming soon...*