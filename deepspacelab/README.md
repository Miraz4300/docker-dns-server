[![Build status](https://ci.appveyor.com/api/projects/status/31l6ynm0a1fhr2vs/branch/master?svg=true)](https://ci.appveyor.com/project/mrpond/blockthespot/branch/master)
![alt text](https://deepspacelab.blob.core.windows.net/trademark/deepspacelab.png "Deep Space Lab")


# Prerequisites:

1. Python3
2. pip3
3. Flask Framework


Pi-hole Docker image isn't come with python image. So we have to install python packages by traditional procedure:

**Login-in to pihole docker container:** `docker exec -it phole bash`

```sudo apt install python3-pip ( which install python3 packages along with pip3)```


**For Flask Framework installation:**

```sudo pip3 install Flask```







##### All files in this folder is also available on cloud in raw format. Latest changes will be available there before releasing stable version on github.

- [callreq.py](https://mirazdsl.blob.core.windows.net/docker-pihole/callreq.py)
- [blockregex.sh](https://mirazdsl.blob.core.windows.net/docker-pihole/blockregex.sh)
- [un](https://mirazdsl.blob.core.windows.net/docker-pihole/unblockregex.sh)