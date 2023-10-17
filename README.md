# Bean Identification

## Running This Code
To start, open your preferred terminal and run:
```
docker build . -t beandock
```
This code builds a Docker container called beandock. We then run Docker using this container, with the code:

```
docker run -d -e PASSWORD=pass --rm -p 8787:8787 -v $(pwd):/home/rstudio/project -t beandock
```

*(!)* If you're using Windows Powershell, this command may not work for you. In that case, try the following command (where the parentheses surrounding pwd have been replaced with curly brackets instead)

```
docker run -d -e PASSWORD=pass --rm -p 8787:8787 -v ${pwd}:/home/rstudio/project -t beandock
```

*(!)* If you're already using `localhost:8787`, you can change the second number to a different number, i.e. `8787:8786` and try using a different port.


From there, we can log onto our locally hosted RStudio server. Open your preferred web browser, and navigate to `localhost:8787` (changing the number here if you had a busy port). Then, log on with the following credentials. Your username is `rstudio` and your password will be `pass`.

## Data Information

This dataset consists of a collection of dry beans of various different species alongside several of their attributes. The dataset was created by M. Koklu and I.A. Ozkan.

__Citation:__ KOKLU, M. and OZKAN, I.A., (2020), Multiclass Classification of Dry Beans Using Computer Vision and Machine Learning Techniques. Computers and Electronics in Agriculture, 174, 105507. DOI: https://doi.org/10.1016/j.compag.2020.105507