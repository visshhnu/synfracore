# AI & ML Fundamentals Certification Guide

## Certifications Available

| Cert | Provider | Level | Cost | Format |
|------|----------|-------|------|--------|
| **AWS AI Practitioner (AIF-C01)** | AWS | Beginner | $150 | MCQ, 90 min |
| **Microsoft AI-900** | Microsoft | Beginner | $165 | MCQ, 60 min |
| **Google Cloud Digital Leader** | Google | Beginner | $99 | MCQ, 90 min |
| **DeepLearning.AI ML Specialization** | Coursera | Intermediate | ~$300 | Project-based |
| **TensorFlow Developer Certificate** | Google | Intermediate | $100 | Coding exam, 5 hrs |

---

## Core Concepts — All AI Certs Test These

```
MACHINE LEARNING TYPES:
  Supervised:    labelled data → predict output (classification, regression)
  Unsupervised:  no labels → find patterns (clustering, dimensionality reduction)
  Reinforcement: agent + environment → maximise cumulative reward

KEY ALGORITHMS:
  Linear Regression:    predict continuous values (house prices, salary)
  Logistic Regression:  binary classification (spam/not spam, fraud/normal)
  Decision Trees:       interpretable, splits by information gain
  Random Forests:       ensemble of trees, reduces overfitting
  SVM:                  maximum margin classification
  K-Means:              unsupervised clustering (group similar items)
  Neural Networks:      layered perceptrons for complex non-linear patterns

EVALUATION METRICS:
  Classification:
    Accuracy = correct / total  (misleading for imbalanced classes)
    Precision = TP / (TP + FP)  (quality of positive predictions)
    Recall = TP / (TP + FN)     (coverage of actual positives)
    F1 = 2 x P x R / (P+R)      (harmonic mean — balance precision/recall)
    AUC-ROC: area under curve   (1.0 = perfect, 0.5 = random)
  
  Regression:
    MAE: mean absolute error | RMSE: penalises large errors more | R2: fit quality

DEEP LEARNING:
  Layers: Dense (fully connected), Conv2D (images), LSTM/GRU (sequences)
  Activations: ReLU (hidden layers), Sigmoid (binary), Softmax (multi-class)
  Training: forward pass → loss function → backpropagation → weight update
  Overfitting prevention: Dropout, L1/L2 regularisation, early stopping, data augmentation

TRANSFORMER AND LLM FUNDAMENTALS:
  Tokenisation:    text split into subword tokens (not words)
  Self-attention:  each token attends to all others with learned weights
  Pre-training:    predict next token on massive corpus (unsupervised)
  Fine-tuning:     adapt pre-trained model to specific task with labelled data
  RLHF:           reinforcement learning from human feedback (align to preferences)
  RAG:             retrieval-augmented generation (inject knowledge at inference time)
```

---

## AWS AI Practitioner (AIF-C01) Key Services

```
Amazon SageMaker:     build, train, deploy ML models (managed platform)
Amazon Bedrock:       foundation models as API (Claude, Llama, Titan, Stable Diffusion)
Amazon Rekognition:   image/video analysis (object detection, faces, text)
Amazon Comprehend:    NLP (sentiment, entities, key phrases, language detection)
Amazon Textract:      extract text + structure from documents (OCR + layout)
Amazon Polly:         text to speech | Amazon Transcribe: speech to text
Amazon Translate:     machine translation | Amazon Kendra: intelligent search
Amazon Personalize:   recommendation engine (like Netflix recommendations)
Amazon Forecast:      time-series forecasting

Exam domains (AIF-C01):
  AI/ML Fundamentals (20%) | Generative AI Fundamentals (24%)
  Foundation Model Applications (28%) | Responsible AI (14%)
  Security and Governance (14%)
```

---

## Microsoft AI-900 Key Services

```
Azure OpenAI Service:     GPT-4, DALL-E, Whisper deployed on Azure infrastructure
Azure AI Vision:          image analysis, OCR, face detection, spatial analysis
Azure AI Language:        sentiment, NER, translation, summarisation, QnA
Azure AI Search:          semantic search with vector support (RAG foundation)
Azure AI Speech:          text-to-speech, speech-to-text, speaker recognition
Azure Machine Learning:   end-to-end ML platform (train, register, deploy, monitor)
```

## Study Resources

- **Microsoft Learn** — free AI-900 modules with sandbox (8-10 hours total)
- **AWS Skill Builder** — free AIF-C01 learning plan with digital labs
- **Andrew Ng ML Specialization** — Coursera, audit free, 3 courses (gold standard)
- **Fast.ai** (fast.ai) — free, top-down practical deep learning
- **Kaggle Learn** — free micro-courses with hands-on notebooks

## Revision Notes
```
AI-900: non-technical, 60 min, 700/1000 — good first cert for anyone
AIF-C01: newer (2024), GenAI-focused, AWS services — for AWS practitioners

SUPERVISED vs UNSUPERVISED vs REINFORCEMENT — know the difference cold
METRICS: Precision (quality) | Recall (coverage) | F1 (balance)
  Use F1 when classes are imbalanced

NEURAL NETS: input → hidden layers (ReLU) → output (softmax/sigmoid) → loss → backprop
TRANSFORMER: self-attention = tokens look at each other with learned importance weights
LLM PATH: pre-train (next token) → instruction fine-tune → RLHF → deployment

PITFALLS:
  Overfitting: memorises training → fails on test → add dropout, more data
  Underfitting: too simple → more complex model, more features
  Data leakage: test data influences training → strict train/validation/test split
  Class imbalance: dominant class inflates accuracy → use F1, SMOTE, class weights
```
