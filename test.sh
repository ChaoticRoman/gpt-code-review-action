#!/usr/bin/env bash
export OPENAI_API_KEY=${OPENAI_API_KEY:-$(cat .api_key)}
export MODEL=o3-mini
export COMMIT_TITLE=test
export COMMIT_BODY=test
export MAX_LENGTH=256
export PROMPT="Follow instructions that are introduced as a code."

python3.14 -m venv .venv
source .venv/bin/activate
python3.14 -m pip install -r requirements.txt

echo 'Say "It works!", nothing else, please.' | python3.14 analyze_code_changes.py

deactivate
rm -rf .venv
