
PPTX_NAME=your_filename
PPTX_FILE=${PPTX_NAME}.pptx

SLIDEX_IMAGE_NAME=slidex
SLIDEX_PPTX_AUTHOR=heriet
TEXTLINT_IMAGE_NAME=textlint

build:
	docker build -t ${SLIDEX_IMAGE_NAME} -f slidex.dockerfile .

convert:
	rm -rf ${PPTX_NAME}
	docker run --rm \
		-v ${PWD}:/work \
		${SLIDEX_IMAGE_NAME} \
			R -e 'library(slidex); convert_pptx(path = "${PPTX_FILE}", author = "${SLIDEX_PPTX_AUTHOR}")'

lint:
	docker run -it --rm \
		-v ${PWD}:/work \
		${TEXTLINT_IMAGE_NAME} \
			${PPTX_NAME}/*
