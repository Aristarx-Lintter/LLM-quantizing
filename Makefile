CONTAINER_NAME := quantizer
docker_flags = --rm --ipc=host --network=host
gguf_convertation = --convert "/models/Llama-3.1-Storm-8B" --outtype f32
gguf_quantizing = --quantize "/models/Llama-3.1-Storm-8B/Llama-3.1-Storm-8B-F32.gguf" "/models/Llama-3.1-Storm-8B/Llama-3.1-Storm-8B-Q4_K_M.bin" "Q4_K_M"

llama-cpp_convert:
	docker run $(docker_flags) \
		--name $(CONTAINER_NAME)_llama_cpp \
		-v ./model:/model \
		ghcr.io/ggerganov/llama.cpp:full $(gguf_convertation)

llama-cpp_quant:
	docker run $(docker_flags) \
		--name $(CONTAINER_NAME)_llama_cpp \
		-v ./model:/model \
		ghcr.io/ggerganov/llama.cpp:full $(gguf_quantizing)

vllm:
	docker run -d $(docker_flags) \
		--name $(CONTAINER_NAME)_vllm \
		--entrypoint bash \
		--gpus=all --runtime nvidia \
		-v ./:/vllm-workspace/ \
		vllm/vllm-openai -c "while true; do sleep 30; done;"

jupyter:
	jupyter lab --allow-root --ip=0.0.0.0 --port=8888 --no-browser --NotebookApp.token=${CONTAINER_NAME}