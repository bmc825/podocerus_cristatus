To build a Jupyter Book, you have three options.

1. Build entire book all at once. In commandline type:

```
jupyter-book build .
```


2. Build each chapter/section at a time. For example, in commandline:

```
jupyter-book build Question_3
```


3. Build each subsection at a time. For example, in commandline:

```
jupyter-book build Question_3/01_model_1.ipynb
```

>**_NOTE_**: Because our Bayesian models take a long time to run, we will build/save the models in Rstudio before constructing the notebook with the saved models. This will save a lot of time on the notebook building end. If you constructed the models in Jupyter notebook, export it as a markdown file and convert to Rmarkdown before opening in Rstudio for model construction.

```
jupyter-nbconvert --to markdown Question_3/01_model_1.ipynb

cd Question_3
mv 01_model_1.md 01_model_1.Rmd
```

>**_BONUS_**:To build a single PDF from your book’s HTML, use the playwright program. Use the following command:
```
jupyter-book build chapter3_data_analysis/ --builder pdfhtml
```