# Quantization of LLMs

This project focuses on the quantization of large language models (LLMs) with the aim of comparing perplexity (PPL), speed, and model size across various quantization formats.

## Overview

This project allows you to experiment with different quantization methods for LLMs using the gguf, 
AWQ, and interior basis quantizing methods in vLLM. 
You can utilize Jupyter for experimentation, perform quantization via dedicated Docker containers, and compare results effectively.

## Makefile Commands

### 0. Download the model via huggingface-cli

### 1. Convert GGUF Model

To convert a model to the GGUF format, run:

```bash
make llama-cpp_convert
```

This command uses the `llama.cpp` Docker image to convert the model located in `/models/Llama-3.1-Storm-8B`.

### 2. Quantize GGUF Model

To quantize a GGUF model, run:

```bash
make llama-cpp_quant
```

This command quantizes the model from `F32` to `Q4_K_M` format.

### 3. Start VLLM Container

To run the VLLM container (with GPU support), execute:

```bash
make vllm
```

This starts a detached container where you can perform in-model quantization and testing.

### 4. Start Jupyter Lab

To start Jupyter Lab for experimentation, use:

```bash
make jupyter
```
Access Jupyter Lab via `http://localhost:8888` using the token set to the container name.


### 5. Don't forget to enjoy)))


## Experimentation

Once Jupyter Lab is running, you can experiment with different quantization techniques, including:

- `AWQ`
- `int W8A8`
- `F8`
- `Q_4_M GGUF`

Use the Jupyter notebook to run experiments and record your observations regarding PPL, speed, and model size.

## Results

| Quantization Type | PPL | Speed | Model Size |
|-------------------|-----|-------|------------|
| W8A8              |     |       |            |
| F8                |     |       |            |
| Q_4_M GGUF        |     |       |            |
| AWQ               |     |       |            |

*Fill in the table with your experimental results.*
