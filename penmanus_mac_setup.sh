#!/bin/bash

echo "🛠 Creating Conda environment..."
conda create -n open-manus python=3.10 -y
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate open-manus

echo "📦 Cloning Open Manus repository..."
git clone https://github.com/open-manus/open-manus.git
cd open-manus

echo "📥 Installing Python dependencies..."
pip install -r requirements.txt

echo "🔑 Configuring API key..."
read -p "Enter your API key: " api_key
echo "api_key: \"$api_key\"" > config.yaml

echo "🚀 Launching Open Manus agent..."
python main.py
