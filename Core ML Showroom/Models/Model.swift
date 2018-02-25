//
//  Model.swift
//  Core ML Showroom
//
//  Created by Raphael on 2/25/18.
//  Copyright © 2018 ghearly. All rights reserved.
//

import Foundation

struct Model {
    
    let title : String
    let shortDesc : String
    let longDesc : String
    let referenceURL : String
    let demoURL : String
    let modelViewController : Any?
    
}

struct Category {
    
    let title : String
    let shortDesc : String
    let image : String
    let models : [Model]
    
}

let categories = [Category(title: "Image Processing", shortDesc: "Models that takes image data as input and output useful information about the image.", image: "imageprocessing", models: imageProcessingModels),
                  Category(title: "Style Transfer", shortDesc: "Models that transform image to specific style.", image: "styletransfer", models: styleTransferModels),
                  Category(title: "Text Analysis", shortDesc: "Models that takes text data as input and output useful information about the text.", image: "textanalysis", models: textAnalysisModels),
                  Category(title: "Others", shortDesc: "", image: "others", models: othersModels)]

let imageProcessingModels = [Model(title: "MobileNet", shortDesc: "The network from the paper 'MobileNets: Efficient Convolutional Neural Networks for Mobile Vision Applications', trained on the ImageNet dataset.", longDesc: "We present a class of efficient models called MobileNets for mobile and embedded vision applications. MobileNets are based on a streamlined architecture that uses depth-wise separable convolutions to build light weight deep neural networks. We introduce two simple global hyper-parameters that efficiently trade off between latency and accuracy. These hyper-parameters allow the model builder to choose the right sized model for their application based on the constraints of the problem. We present extensive experiments on resource and accuracy tradeoffs and show strong performance compared to other popular models on ImageNet classification. We then demonstrate the effectiveness of MobileNets across a wide range of applications and use cases including object detection, finegrain classification, face attributes and large scale geo-localization.", referenceURL: "https://arxiv.org/abs/1704.04861", demoURL: "https://github.com/hollance/MobileNet-CoreML", modelViewController: MobileNetModelViewController()),
                             Model(title: "GoogLeNetPlaces", shortDesc: "Detects the scene of an image from 205 categories such as airport, bedroom, forest, coast etc.", longDesc: "Scene recognition is one of the hallmark tasks of computer vision, allowing defining a context for object recognition. Here we introduce a new scene-centric database called Places, with 205 scene categories and 2.5 millions of images with a category label. Using convolutional neural network (CNN), we learn deep scene features for scene recognition tasks, and establish new state-of-the-art performances on scene-centric benchmarks. Here we provide the Places Database and the trained CNNs for academic research and education purposes.", referenceURL: "http://places.csail.mit.edu/index.html", demoURL: "https://github.com/chenyi1989/CoreMLDemo", modelViewController: GoogLeNetPlacesViewController()),
                             Model(title: "Inceptionv3", shortDesc: "Detects the dominant objects present in an image from a set of 1000 categories such as trees, animals, food, vehicles, person etc. The top-5 error from the original publication is 5.6%.", longDesc: "Convolutional networks are at the core of most state-of-the-art computer vision solutions for a wide variety of tasks. Since 2014 very deep convolutional networks started to become mainstream, yielding substantial gains in various benchmarks. Although increased model size and computational cost tend to translate to immediate quality gains for most tasks (as long as enough labeled data is provided for training), computational efficiency and low parameter count are still enabling factors for various use cases such as mobile vision and big-data scenarios. Here we explore ways to scale up networks in ways that aim at utilizing the added computation as efficiently as possible by suitably factorized convolutions and aggressive regularization. We benchmark our methods on the ILSVRC 2012 classification challenge validation set demonstrate substantial gains over the state of the art: 21.2% top-1 and 5.6% top-5 error for single frame evaluation using a network with a computational cost of 5 billion multiply-adds per inference and with using less than 25 million parameters. With an ensemble of 4 models and multi-crop evaluation, we report 3.5% top-5 error on the validation set (3.6% error on the test set) and 17.3% top-1 error on the validation set.", referenceURL: "https://arxiv.org/abs/1512.00567", demoURL: "https://github.com/yulingtianxia/Core-ML-Sample/", modelViewController: Inceptionv3ViewController()),
                             Model(title: "Resnet50", shortDesc: "Detects the dominant objects present in an image from a set of 1000 categories such as trees, animals, food, vehicles, person etc. The top-5 error from the original publication is 7.8%.", longDesc: "Deeper neural networks are more difficult to train. We present a residual learning framework to ease the training of networks that are substantially deeper than those used previously. We explicitly reformulate the layers as learning residual functions with reference to the layer inputs, instead of learning unreferenced functions. We provide comprehensive empirical evidence showing that these residual networks are easier to optimize, and can gain accuracy from considerably increased depth. On the ImageNet dataset we evaluate residual nets with a depth of up to 152 layers---8x deeper than VGG nets but still having lower complexity. An ensemble of these residual nets achieves 3.57% error on the ImageNet test set. This result won the 1st place on the ILSVRC 2015 classification task. We also present analysis on CIFAR-10 with 100 and 1000 layers.\n The depth of representations is of central importance for many visual recognition tasks. Solely due to our extremely deep representations, we obtain a 28% relative improvement on the COCO object detection dataset. Deep residual nets are foundations of our submissions to ILSVRC & COCO 2015 competitions, where we also won the 1st places on the tasks of ImageNet detection, ImageNet localization, COCO detection, and COCO segmentation.", referenceURL: "https://arxiv.org/abs/1512.03385", demoURL: "https://github.com/atomic14/VisionCoreMLSample", modelViewController: Resnet50ViewController()),
                             Model(title: "VGG16", shortDesc: "Detects the dominant objects present in an image from a set of 1000 categories such as trees, animals, food, vehicles, person etc. The top-5 error from the original publication is 7.4%.", longDesc: "In this work we investigate the effect of the convolutional network depth on its accuracy in the large-scale image recognition setting. Our main contribution is a thorough evaluation of networks of increasing depth using an architecture with very small (3x3) convolution filters, which shows that a significant improvement on the prior-art configurations can be achieved by pushing the depth to 16-19 weight layers. These findings were the basis of our ImageNet Challenge 2014 submission, where our team secured the first and the second places in the localisation and classification tracks respectively. We also show that our representations generalise well to other datasets, where they achieve state-of-the-art results. We have made our two best-performing ConvNet models publicly available to facilitate further research on the use of deep visual representations in computer vision.", referenceURL: "https://arxiv.org/abs/1409.1556", demoURL: "https://github.com/alaphao/CoreMLExample", modelViewController: VGG16ViewController()),
                             Model(title: "CarRecognition", shortDesc: "Predict the brand & model of a car.", longDesc: "This dataset is presented in our CVPR 2015 paper,\nLinjie Yang, Ping Luo, Chen Change Loy, Xiaoou Tang. A Large-Scale Car Dataset for Fine-Grained Categorization and Verification, In Computer Vision and Pattern Recognition (CVPR), 2015. PDF\n\nThe Comprehensive Cars (CompCars) dataset contains data from two scenarios, including images from web-nature and surveillance-nature. The web-nature data contains 163 car makes with 1,716 car models. There are a total of 136,726 images capturing the entire cars and 27,618 images capturing the car parts. The full car images are labeled with bounding boxes and viewpoints. Each car model is labeled with five attributes, including maximum speed, displacement, number of doors, number of seats, and type of car. The surveillance-nature data contains 50,000 car images captured in the front view. Please refer to our paper for the details.\n\nThe dataset is well prepared for the following computer vision tasks:\n\n  • Fine-grained classification\n  • Attribute prediction\n  • Car model verification\n\n The train/test subsets of these tasks introduced in our paper are included in the dataset. Researchers are also welcome to utilize it for any other tasks such as image ranking, multi-task learning, and 3D reconstruction.", referenceURL: "http://mmlab.ie.cuhk.edu.hk/datasets/comp_cars/index.html", demoURL: "https://github.com/likedan/Core-ML-Car-Recognition", modelViewController: CarRecognitionViewController()),
                             Model(title: "TinyYOLO", shortDesc: "The Tiny YOLO network from the paper 'YOLO9000: Better, Faster, Stronger' (2016), arXiv:1612.08242", longDesc: "Object detection is one of the classical problems in computer vision:\n\nRecognize what the objects are inside a given image and also where they are in the image.\n\nDetection is a more complex problem than classification, which can also recognize objects but doesn’t tell you exactly where the object is located in the image — and it won’t work for images that contain more than one object.\n\nYOLO is a clever neural network for doing object detection in real-time.\n\nIn this blog post I’ll describe what it took to get the “tiny” version of YOLOv2 running on iOS using Metal Performance Shaders.", referenceURL: "http://machinethink.net/blog/object-detection-with-yolo", demoURL: "https://github.com/hollance/YOLO-CoreML-MPSNNGraph", modelViewController: TinyYOLOViewController()),
                             Model(title: "AgeNet", shortDesc: "Age Classification using Convolutional Neural Networks", longDesc: "Automatic age and gender classification has become relevant to an increasing amount of applications, particularly since the rise of social platforms and social media. Nevertheless, performance of existing methods on real-world images is still significantly lacking, especially when compared to the tremendous leaps in performance recently reported for the related task of face recognition. In this paper we show that by learning representations through the use of deep-convolutional neural networks (CNN), a significant increase in performance can be obtained on these tasks. To this end, we propose a simple convolutional net architecture that can be used even when the amount of learning data is limited. We evaluate our method on the recent Adience benchmark for age and gender estimation and show it to dramatically outperform current state-of-the-art methods.", referenceURL: "http://www.openu.ac.il/home/hassner/projects/cnn_agegender/", demoURL: "https://github.com/cocoa-ai/FacesVisionDemo", modelViewController: AgeNetViewController()),
                             Model(title: "GenderNet", shortDesc: "Gender Classification using Convolutional Neural Networks", longDesc: "Automatic age and gender classification has become relevant to an increasing amount of applications, particularly since the rise of social platforms and social media. Nevertheless, performance of existing methods on real-world images is still significantly lacking, especially when compared to the tremendous leaps in performance recently reported for the related task of face recognition. In this paper we show that by learning representations through the use of deep-convolutional neural networks (CNN), a significant increase in performance can be obtained on these tasks. To this end, we propose a simple convolutional net architecture that can be used even when the amount of learning data is limited. We evaluate our method on the recent Adience benchmark for age and gender estimation and show it to dramatically outperform current state-of-the-art methods.", referenceURL: "http://www.openu.ac.il/home/hassner/projects/cnn_agegender/", demoURL: "https://github.com/cocoa-ai/FacesVisionDemo", modelViewController: GenderNetViewController()),
                             Model(title: "MNIST", shortDesc: "Predicts a handwritten digit.", longDesc: "The MNIST database of handwritten digits, available from this page, has a training set of 60,000 examples, and a test set of 10,000 examples. It is a subset of a larger set available from NIST. The digits have been size-normalized and centered in a fixed-size image.\n\nIt is a good database for people who want to try learning techniques and pattern recognition methods on real-world data while spending minimal efforts on preprocessing and formatting.", referenceURL: "http://yann.lecun.com/exdb/mnist/", demoURL: "https://github.com/ph1ps/MNIST-CoreML", modelViewController: MNISTViewController()),
                             Model(title: "CNNEmotions", shortDesc: "Emotion Recognition in the Wild via Convolutional Neural Networks and Mapped Binary Patterns", longDesc: "We present a novel method for classifying emotions from static facial images. Our approach leverages on the recent success of Convolutional Neural Networks (CNN) on face recognition problems. Unlike the settings often assumed there, far less labeled data is typically available for training emotion classi cation systems. Our method is therefore designed with the goal of simplifying the problem domain by removing confounding factors from the input images, with an emphasis on image illumination variations. This, in an effort to reduce the amount of data required to e ectively train deep CNN models. To this end, we propose novel transformations of image intensities to 3D spaces, designed to be invariant to monotonic photometric transformations. These are applied to CASIA Webface images which are then used to train an ensemble of multiple architecture CNNs on multiple representations. Each model is then ne-tuned with limited emotion labeled training data to obtain nal classi cation models. Our method was tested on the Emotion Recognition in the Wild Challenge (EmotiW 2015), Static Facial Expression Recognition sub-challenge (SFEW) and shown to provide a substantial, 15.36% improvement over baseline results (40% gain in performance)*.", referenceURL: "http://www.openu.ac.il/home/hassner/projects/cnn_emotions/", demoURL: "https://github.com/cocoa-ai/FacesVisionDemo", modelViewController: CNNEmotionsViewController()),
                             Model(title: "VisualSentimentCNN", shortDesc: "Fine-tuning CNNs for Visual Sentiment Prediction", longDesc: "Visual multimedia have become an inseparable part of our digital social lives, and they often capture moments tied with deep affections. Automated visual sentiment analysis tools can provide a means of extracting the rich feelings and latent dispositions embedded in these media. In this work, we explore how Convolutional Neural Networks (CNNs), a now de facto computational machine learning tool particularly in the area of Computer Vision, can be specifically applied to the task of visual sentiment prediction. We accomplish this through fine-tuning experiments using a state-of-the-art CNN and via rigorous architecture analysis, we present several modifications that lead to accuracy improvements over prior art on a dataset of images from a popular social media platform. We additionally present visualizations of local patterns that the network learned to associate with image sentiment for insight into how visual positivity (or negativity) is perceived by the model.", referenceURL: "http://www.sciencedirect.com/science/article/pii/S0262885617300355?via%3Dihub", demoURL: "https://github.com/cocoa-ai/SentimentVisionDemo", modelViewController: VisualSentimentCNNViewController()),
                             Model(title: "Food101", shortDesc: "This model takes a picture of a food and predicts its name", longDesc: "UPMC Food-101 is a large multimodal dataset containing about 100,000 items of food recipes classified in 101 categories. This dataset was crawled from the web and each item consists of an image and the HTML webpage on which it was found.\n\nThis dataset can be considered as a “twin dataset” of ETHZ Food-101. Indeed, they both share the same 101 categories and have approximately the same size.\n\nThe categories of both UPMC Food-101 and ETHZ Food-101 are the 101 most popular categories from the food picture sharing website foodspotting.com. However, the images from ETHZ Food-101 are also taken from this website whereas UPMC Food-101's images have been crawled from Google Images searches of the category name followed by “recipe”.", referenceURL: "http://visiir.lip6.fr/explore", demoURL: "https://github.com/ph1ps/Food101-CoreML", modelViewController: Food101ViewController()),
                             Model(title: "Oxford102", shortDesc: "Classifying images in the Oxford 102 flower dataset with CNNs", longDesc: "This bootstraps the training of deep convolutional neural networks with Caffe to classify images in the Oxford 102 category flower dataset. A more detailed explanation can be found here. The prototxt files for fine-tuning AlexNet and VGG_S models are included and use initial weights from training on the ILSVRC 2012 (ImageNet) data.", referenceURL: "http://jimgoo.com/flower-power/", demoURL: "https://github.com/cocoa-ai/FlowersVisionDemo", modelViewController: Oxford102ViewController()),
                             Model(title: "FlickrStyle", shortDesc: "Finetuning CaffeNet on Flickr Style", longDesc: "The style of an image plays a significant role in how it is viewed, but style has re- ceived little attention in computer vision research. We describe an approach to predicting style of images, and perform a thorough evaluation of different image features for these tasks. We find that features learned in a multi-layer network generally perform best – even when trained with object class (not style) labels. Our large-scale learning methods results in the best published performance on an existing dataset of aesthetic ratings and photographic style annotations. We present two novel datasets: 80K Flickr photographs annotated with 20 curated style labels, and 85K paintings annotated with 25 style/genre labels. Our approach shows excellent classification performance on both datasets. We use the learned classifiers to extend traditional tag-based image search to consider stylis- tic constraints, and demonstrate cross-dataset understanding of style.", referenceURL: "http://sergeykarayev.com/files/1311.3715v3.pdf", demoURL: "https://github.com/cocoa-ai/StylesVisionDemo", modelViewController: FlickrStyleViewController()),
                             Model(title: "RN1015k500", shortDesc: "Predict the location where a picture was taken.", longDesc: "This is a guest post by Jaeyoung Choi of the International Computer Science Institute and Kevin Li of the University of California, Berkeley. This project demonstrates how academic researchers can leverage our AWS Cloud Credits for Research Program to support their scientific breakthroughs.\n\nModern mobile devices can automatically assign geo-coordinates to images when you take pictures of them. However, most images on the web still lack this location metadata. Image geo-location is the process of estimating the location of an image and applying a location label. Depending on the size of your dataset and how you pose the problem, the assigned location label can range from the name of a building or landmark to an actual geo-coordinate (latitude, longitude).\n\nIn this post, we show how to use a pre-trained model created with Apache MXNet to geographically categorize images. We use images from a dataset that contains millions of Flickr images taken around the world. We also show how to map the result to visualize it.", referenceURL: "https://aws.amazon.com/blogs/ai/estimating-the-location-of-images-using-mxnet-and-multimedia-commons-dataset-on-aws-ec2", demoURL: "https://github.com/awslabs/MXNet2CoreML_iOS_sample_app", modelViewController: RN1015k500ViewController()),
                             Model(title: "Nudity", shortDesc: "Classifies an image either as NSFW (nude) or SFW (not nude)", longDesc: "Detecting offensive / adult images is an important problem which researchers have tackled for decades. With the evolution of computer vision and deep learning the algorithms have matured and we are now able to classify an image as not suitable for work with greater precision.\n\nDefining NSFW material is subjective and the task of identifying these images is non-trivial. Moreover, what may be objectionable in one context can be suitable in another. For this reason, the model we describe below focuses only on one type of NSFW content: pornographic images. The identification of NSFW sketches, cartoons, text, images of graphic violence, or other types of unsuitable content is not addressed with this model.\n\nSince images and user generated content dominate the internet today, filtering nudity and other not suitable for work images becomes an important problem. In this repository we opensource a Caffe deep neural network for preliminary filtering of NSFW images.", referenceURL: "https://github.com/yahoo/open_nsfw", demoURL: "https://github.com/ph1ps/Nudity-CoreML", modelViewController: NudityViewController())
]

let styleTransferModels = [Model(title: "HED_so", shortDesc: "Holistically-Nested Edge Detection. Side outputs", longDesc: "We develop a new edge detection algorithm, holistically-nested edge detection (HED), which performs image-to-image prediction by means of a deep learning model that leverages fully convolutional neural networks and deeply-supervised nets. HED automatically learns rich hierarchical representations (guided by deep supervision on side responses) that are important in order to resolve the challenging ambiguity in edge and object boundary detection. We significantly advance the state-of-the-art on the BSD500 dataset (ODS F-score of .790) and the NYU Depth dataset (ODS F-score of .746), and do so with an improved speed (0.4s per image). Detailed description of the system can be found in our paper.", referenceURL: "http://dl.acm.org/citation.cfm?id=2654889", demoURL: "https://github.com/s1ddok/HED-CoreML", modelViewController: HED_soViewController()),
                           Model(title: "FNS-Candy", shortDesc: "Feedforward style transfer", longDesc: "We consider image transformation problems, where an input image is transformed into an output image. Recent methods for such problems typically train feed-forward convolutional neural networks using a per-pixel loss between the output and ground-truth images. Parallel work has shown that high-quality images can be generated by defining and optimizing perceptual loss functions based on high-level features extracted from pretrained networks. We combine the benefits of both approaches, and propose the use of perceptual loss functions for training feed-forward networks for image transformation tasks. We show results on image style transfer, where a feed-forward network is trained to solve the optimization problem proposed by Gatys et al. in real-time. Compared to the optimization-based method, our network gives similar qualitative results but is three orders of magnitude faster. We also experiment with single-image super-resolution, where replacing a per-pixel loss with a perceptual loss gives visually pleasing results.", referenceURL: "http://cs.stanford.edu/people/jcjohns/eccv16/", demoURL: "https://github.com/prisma-ai/torch2coreml", modelViewController: FNS_CandyViewController()),
                           Model(title: "FNS-Feathers", shortDesc: "Feedforward style transfer", longDesc: "We consider image transformation problems, where an input image is transformed into an output image. Recent methods for such problems typically train feed-forward convolutional neural networks using a per-pixel loss between the output and ground-truth images. Parallel work has shown that high-quality images can be generated by defining and optimizing perceptual loss functions based on high-level features extracted from pretrained networks. We combine the benefits of both approaches, and propose the use of perceptual loss functions for training feed-forward networks for image transformation tasks. We show results on image style transfer, where a feed-forward network is trained to solve the optimization problem proposed by Gatys et al. in real-time. Compared to the optimization-based method, our network gives similar qualitative results but is three orders of magnitude faster. We also experiment with single-image super-resolution, where replacing a per-pixel loss with a perceptual loss gives visually pleasing results.", referenceURL: "http://cs.stanford.edu/people/jcjohns/eccv16/", demoURL: "https://github.com/prisma-ai/torch2coreml", modelViewController: FNS_FeathersViewController()),
                           Model(title: "FNS-La-Muse", shortDesc: "Feedforward style transfer", longDesc: "We consider image transformation problems, where an input image is transformed into an output image. Recent methods for such problems typically train feed-forward convolutional neural networks using a per-pixel loss between the output and ground-truth images. Parallel work has shown that high-quality images can be generated by defining and optimizing perceptual loss functions based on high-level features extracted from pretrained networks. We combine the benefits of both approaches, and propose the use of perceptual loss functions for training feed-forward networks for image transformation tasks. We show results on image style transfer, where a feed-forward network is trained to solve the optimization problem proposed by Gatys et al. in real-time. Compared to the optimization-based method, our network gives similar qualitative results but is three orders of magnitude faster. We also experiment with single-image super-resolution, where replacing a per-pixel loss with a perceptual loss gives visually pleasing results.", referenceURL: "http://cs.stanford.edu/people/jcjohns/eccv16/", demoURL: "https://github.com/prisma-ai/torch2coreml", modelViewController: FNS_La_MuseViewController()),
                           Model(title: "FNS-The-Scream", shortDesc: "Feedforward style transfer", longDesc: "We consider image transformation problems, where an input image is transformed into an output image. Recent methods for such problems typically train feed-forward convolutional neural networks using a per-pixel loss between the output and ground-truth images. Parallel work has shown that high-quality images can be generated by defining and optimizing perceptual loss functions based on high-level features extracted from pretrained networks. We combine the benefits of both approaches, and propose the use of perceptual loss functions for training feed-forward networks for image transformation tasks. We show results on image style transfer, where a feed-forward network is trained to solve the optimization problem proposed by Gatys et al. in real-time. Compared to the optimization-based method, our network gives similar qualitative results but is three orders of magnitude faster. We also experiment with single-image super-resolution, where replacing a per-pixel loss with a perceptual loss gives visually pleasing results.", referenceURL: "http://cs.stanford.edu/people/jcjohns/eccv16/", demoURL: "https://github.com/prisma-ai/torch2coreml", modelViewController: FNS_The_ScreamViewController()),
                           Model(title: "FNS-Udnie", shortDesc: "Feedforward style transfer", longDesc: "We consider image transformation problems, where an input image is transformed into an output image. Recent methods for such problems typically train feed-forward convolutional neural networks using a per-pixel loss between the output and ground-truth images. Parallel work has shown that high-quality images can be generated by defining and optimizing perceptual loss functions based on high-level features extracted from pretrained networks. We combine the benefits of both approaches, and propose the use of perceptual loss functions for training feed-forward networks for image transformation tasks. We show results on image style transfer, where a feed-forward network is trained to solve the optimization problem proposed by Gatys et al. in real-time. Compared to the optimization-based method, our network gives similar qualitative results but is three orders of magnitude faster. We also experiment with single-image super-resolution, where replacing a per-pixel loss with a perceptual loss gives visually pleasing results.", referenceURL: "http://cs.stanford.edu/people/jcjohns/eccv16/", demoURL: "https://github.com/prisma-ai/torch2coreml", modelViewController: FNS_UdnieViewController()),
                           Model(title: "FNS-Mosaic", shortDesc: "Feedforward style transfer", longDesc: "We consider image transformation problems, where an input image is transformed into an output image. Recent methods for such problems typically train feed-forward convolutional neural networks using a per-pixel loss between the output and ground-truth images. Parallel work has shown that high-quality images can be generated by defining and optimizing perceptual loss functions based on high-level features extracted from pretrained networks. We combine the benefits of both approaches, and propose the use of perceptual loss functions for training feed-forward networks for image transformation tasks. We show results on image style transfer, where a feed-forward network is trained to solve the optimization problem proposed by Gatys et al. in real-time. Compared to the optimization-based method, our network gives similar qualitative results but is three orders of magnitude faster. We also experiment with single-image super-resolution, where replacing a per-pixel loss with a perceptual loss gives visually pleasing results.", referenceURL: "http://cs.stanford.edu/people/jcjohns/eccv16/", demoURL: "https://github.com/prisma-ai/torch2coreml", modelViewController: FNS_MosaicViewController()),
                           Model(title: "AnimeScale2x", shortDesc: "Process a bicubic-scaled anime-style artwork", longDesc: "We propose a deep learning method for single image super-resolution (SR). Our method directly learns an end-to-end mapping between the low/high-resolution images. The mapping is represented as a deep convolutional neural network (CNN) that takes the low-resolution image as the input and outputs the high-resolution one. We further show that traditional sparse-coding-based SR methods can also be viewed as a deep convolutional network. But unlike traditional methods that handle each component separately, our method jointly optimizes all layers. Our deep CNN has a lightweight structure, yet demonstrates state-of-the-art restoration quality, and achieves fast speed for practical on-line usage. We explore different network structures and parameter settings to achieve trade-offs between performance and speed. Moreover, we extend our network to cope with three color channels simultaneously, and show better overall reconstruction quality.", referenceURL: "https://arxiv.org/abs/1501.00092", demoURL: "https://github.com/imxieyi/waifu2x-ios", modelViewController: AnimeScale2xViewController())
]

let textAnalysisModels = [Model(title: "SentimentPolarity", shortDesc: "Sentiment polarity LinearSVC.", longDesc: "The model is based on LinearSVC classifier and is able to distinguish between positive and negative sentences with best CV score = 0.801013024602. It was trained using Epinions.com dataset with reviews of products and services. Accuracy can be improved by using TfidfVectorizer for feature extraction, but it's not supported by coremltools at the moment.", referenceURL: "http://boston.lti.cs.cmu.edu/classes/95-865-K/HW/HW3/", demoURL: "https://github.com/cocoa-ai/SentimentCoreMLDemo", modelViewController: SentimentPolarityViewController()),
                          Model(title: "DocumentClassification", shortDesc: "Classify news articles into 1 of 5 categories.", longDesc: "DocumentClassifier is a Swift framework for classifying documents into one of five categories (Business, Entertainment, Politics, Sports, and Technology). It uses a CoreML model trained with 1,500 news articles from the BBC.", referenceURL: "https://github.com/toddkramer/DocumentClassifier/", demoURL: "https://github.com/toddkramer/DocumentClassifier", modelViewController: DocumentClassificationViewController()),
                          Model(title: "MessageClassifier", shortDesc: "Detect whether a message is spam.", longDesc: "The SMS Spam Collection v.1 is a public set of SMS labeled messages that have been collected for mobile phone spam research. It has one collection composed by 5,574 English, real and non-enconded messages, tagged according being legitimate (ham) or spam.", referenceURL: "http://www.dt.fee.unicamp.br/%7Etiago/smsspamcollection/", demoURL: "https://github.com/gkswamy98/imessage-spam-detection/tree/master", modelViewController: MessageClassifierViewController()),
                          Model(title: "NamesDT", shortDesc: "Gender Classification using DecisionTreeClassifier", longDesc: "This demo is based on An introduction to Machine Learning tutorial, which describes how to build a classifier able to distinguish between boy and girl names using datasets with the popularity of baby names over the years from The US Social Security Administration.", referenceURL: "http://nlpforhackers.io/", demoURL: "https://github.com/cocoa-ai/NamesCoreMLDemo", modelViewController: NamesDTViewController())
]

let othersModels = [Model(title: "Exermote", shortDesc: "Predicts the exercise, when iPhone is worn on right upper arm.", longDesc: "Exermote is a fitness app prototype, which is capable to detect Burpees, Squats and Situps and to count repetitions. Exercise recognition is done with Convolutional LSTM Neural Networks.", referenceURL: "http://lausbert.com/2017/08/03/exermote/", demoURL: "https://github.com/Lausbert/Exermote/tree/master/ExermoteInference", modelViewController: ExermoteViewController()),
                    Model(title: "GestureAI", shortDesc: "Hand-gesture recognizer", longDesc: "GestureAI is a RNN(Recurrent Nerural network) model which recognize hand-gestures drawing 5 figures(Circl, Rectangle, Triangle, Cross and the other). This dataset of hand-motion drawing 5 figures is sequences of 3-axis accelerations captured by iPhone. Example to implement RNN in Keras gets 90.8% accuracy by Cross-validation.", referenceURL: "https://github.com/akimach/GestureAI-iOS/tree/master/GestureAI", demoURL: "https://github.com/akimach/GestureAI-iOS/tree/master/GestureAI", modelViewController: GestureAIViewController())
]







