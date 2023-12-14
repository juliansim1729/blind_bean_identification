# Bean Identification

## Running This Project
To start, open your preferred terminal and run inside this folder (blind_bean_identification if cloned):
```
docker build . -t beandock
```
This code builds a Docker container called beandock. We then run Docker using this container, with the code:

```
docker run -d -e PASSWORD=pass --rm -p 8787:8787 -v $(pwd):/home/rstudio/project -t beandock
```

**(!)** If you're using Windows Powershell, this command may not work for you. In that case, try the following command (where the parentheses surrounding pwd have been replaced with curly brackets instead)

```
docker run -d -e PASSWORD=pass --rm -p 8787:8787 -v ${pwd}:/home/rstudio/project -t beandock
```

**(!)** If you're using Git Bash, this command may result in a new folder called `blind_bean_identification;C`. Try replacing `$(pwd)` with `/$(pwd)`. 

**(!)** If you're already using the port 8787, you can change the first number to a different number, i.e. `8786:8787` and try using a different port. This command is mapping the second number (the internal Docker port) to the first number (your external port) where you can access the page. Please note if you are selecting a new number, some ports may be reserved for common services (such as HTTP) and thus ports in the 8000s are commonly used for Docker.

From there, we can log onto our locally hosted RStudio server. Open your preferred web browser, and navigate to `localhost:8787` (changing the number here if you had a busy port). Then, log on with the following credentials. Your username is `rstudio` and your password is `pass`.

Then, set your working directory to `project`, either through the interface in the bottom right or typing the following in the terminal. 

```
cd project
```

Then, run the following commands in the Terminal.

```
make clean
```

```
make .created-dirs
```

```
make report.pdf
```

## Data Information

This dataset consists of a collection of dry beans of various different species alongside several of their attributes. The dataset was created by M. Koklu and I.A. Ozkan.

__Citation:__ KOKLU, M. and OZKAN, I.A., (2020), Multiclass Classification of Dry Beans Using Computer Vision and Machine Learning Techniques. Computers and Electronics in Agriculture, 174, 105507. DOI: https://doi.org/10.1016/j.compag.2020.105507
