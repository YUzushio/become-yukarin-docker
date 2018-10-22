import numpy as np
import chainer
from chainer import cuda, Function, gradient_check, report, training, utils, Variable
print('GPU availability:', chainer.cuda.available)
print('cuDNN availablility:', chainer.cuda.cudnn_enabled)
