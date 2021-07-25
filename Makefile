.PHONY: hmtl github

html:
	echo "Generate documentation"

github: html
	echo "Deploy documentation to GitHub Pages"