#!/bin/bash
#

rm -rf docs/_build


#git add .
#git commit -m "get the documentation into the blueprint"
#git push

cp docs/index.rst.class1 docs/index.rst
cp docs/conf.py.class1 docs/conf.py

./containthedocs-pdf.sh

######

cp docs/index.rst.class2 docs/index.rst
cp docs/conf.py.class2 docs/conf.py

./containthedocs-pdf.sh

#######

cp docs/index.rst.orig docs/index.rst
cp docs/conf.py.orig docs/conf.py
./containthedocs-build.sh
