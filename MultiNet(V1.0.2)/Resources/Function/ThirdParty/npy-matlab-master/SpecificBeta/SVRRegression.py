# -*- coding: utf-8 -*-
"""
Created on Tue May 14 20:10:04 2019

@author: Administrator
"""


import numpy as np  # numpy库
from sklearn.svm import SVR  # SVM中的回归算法
import pandas as pd  # 导入pandas
import matplotlib.pyplot as plt  # 导入图形展示库
import scipy.io as sio

#### 预测问卷得分 ####
Scores=np.float32(pd.read_excel('questionaire.xlsx'))
CseBeta=np.load('BetaCse.npy')
RseBeta=np.load('BetaRse.npy')
PseBeta=np.load('BetaPse.npy')


Conditions=[CseBeta,RseBeta,PseBeta]

C=np.linspace(0.1,10,100) ## 寻找使得R值最大的参数
PredScores=np.zeros([100,3,50])

Corrcoef=np.zeros([3,100]) 
for cc in range(100):
    model_svr=SVR(kernel='linear',C=C[cc])
    pre_y_list = np.zeros([3,50])  # 三种自尊的预测分数    
    for i in range(3):
        y=Scores[:,i+1]
        x=Conditions[i]
        for j in range(50):
            TrnX=np.concatenate((x[0:j,:],x[j+1:50,:]),axis=0)
            TrnY=np.concatenate((y[0:j],y[j+1:50]),axis=0)
            TestX=x[j,:]
            TestX=np.reshape(TestX,[1,-1])
            pre_y_list[i,j]=model_svr.fit(TrnX, TrnY).predict(TestX)
    CorrCse=np.corrcoef(pre_y_list[0,:],Scores[:,0])
    Corrcoef[0,cc]=CorrCse[0,1]
    CorrRse=np.corrcoef(pre_y_list[1,:],Scores[:,1])
    Corrcoef[1,cc]=CorrRse[0,1]
    CorrPse=np.corrcoef(pre_y_list[2,:],Scores[:,2])
    Corrcoef[2,cc]=CorrPse[0,1]
    PredScores[cc,:,:]=pre_y_list

plt.figure()
plt.plot(C,Corrcoef[0,:],C,Corrcoef[1,:],C,Corrcoef[2,:])
plt.legend(['RValue of CSE','RValue of RSE','RValue of PSE'])
plt.show()

CseInd=np.float32(np.where(Corrcoef[0,:]==np.max(Corrcoef[0,:])))
CseInd=np.int(CseInd[0,0])
CseScores=PredScores[CseInd,0,:]

RseInd=np.float32(np.where(Corrcoef[1,:]==np.max(Corrcoef[1,:])))
RseInd=np.int(RseInd[0,0])
RseScores=PredScores[RseInd,1,:]

PseInd=np.float32(np.where(Corrcoef[2,:]==np.max(Corrcoef[2,:])))
PseInd=np.int(PseInd[0,0])
PseScores=PredScores[PseInd,2,:]
sio.savemat('result/Questionnaire/PredCseScores.mat', {'PredCseScores':CseScores})
sio.savemat('result/Questionnaire/PredRseScores.mat', {'PredRseScores':RseScores})
sio.savemat('result/Questionnaire/PredPseScores.mat', {'PredPseScores':PseScores})

#### 预测互依得分 ####

Conditions=[CseBeta,RseBeta,PseBeta]

PredScores=np.zeros([100,3,50])

Corrcoef=np.zeros([3,100]) 
for cc in range(100):
    model_svr=SVR(kernel='linear',C=C[cc])
    pre_y_list = np.zeros([3,50])  # 三种自尊的预测分数    
    for i in range(3):
        y=Scores[:,4]
        x=Conditions[i]
        for j in range(50):
            TrnX=np.concatenate((x[0:j,:],x[j+1:50,:]),axis=0)
            TrnY=np.concatenate((y[0:j],y[j+1:50]),axis=0)
            TestX=x[j,:]
            TestX=np.reshape(TestX,[1,-1])
            pre_y_list[i,j]=model_svr.fit(TrnX, TrnY).predict(TestX)
    CorrCse=np.corrcoef(pre_y_list[0,:],Scores[:,0])
    Corrcoef[0,cc]=CorrCse[0,1]
    CorrRse=np.corrcoef(pre_y_list[1,:],Scores[:,1])
    Corrcoef[1,cc]=CorrRse[0,1]
    CorrPse=np.corrcoef(pre_y_list[2,:],Scores[:,2])
    Corrcoef[2,cc]=CorrPse[0,1]
    PredScores[cc,:,:]=pre_y_list

plt.figure()
plt.plot(C,Corrcoef[0,:],C,Corrcoef[1,:],C,Corrcoef[2,:])
plt.legend(['RValue of CSE','RValue of RSE','RValue of PSE'])
plt.show()

CseInd=np.float32(np.where(Corrcoef[0,:]==np.max(Corrcoef[0,:])))
CseInd=np.int(CseInd[0])
CseScores=PredScores[CseInd,0,:]

RseInd=np.float32(np.where(Corrcoef[1,:]==np.max(Corrcoef[1,:])))
RseInd=np.int(RseInd[0])
RseScores=PredScores[RseInd,1,:]

PseInd=np.float32(np.where(Corrcoef[2,:]==np.max(Corrcoef[2,:])))
PseInd=np.int(PseInd[0])
PseScores=PredScores[PseInd,2,:]

sio.savemat('result/inter/PredCseScores.mat', {'PredCseScores':CseScores})
sio.savemat('result/inter/PredRseScores.mat', {'PredRseScores':RseScores})
sio.savemat('result/inter/PredPseScores.mat', {'PredPseScores':PseScores})


#### 预测独立得分 ####

Conditions=[CseBeta,RseBeta,PseBeta]

PredScores=np.zeros([100,3,50])

Corrcoef=np.zeros([3,100]) 
for cc in range(100):
    model_svr=SVR(kernel='linear',C=C[cc])
    pre_y_list = np.zeros([3,50])  # 三种自尊的预测分数    
    for i in range(3):
        y=Scores[:,5]
        x=Conditions[i]
        for j in range(50):
            TrnX=np.concatenate((x[0:j,:],x[j+1:50,:]),axis=0)
            TrnY=np.concatenate((y[0:j],y[j+1:50]),axis=0)
            TestX=x[j,:]
            TestX=np.reshape(TestX,[1,-1])
            pre_y_list[i,j]=model_svr.fit(TrnX, TrnY).predict(TestX)
    CorrCse=np.corrcoef(pre_y_list[0,:],Scores[:,0])
    Corrcoef[0,cc]=CorrCse[0,1]
    CorrRse=np.corrcoef(pre_y_list[1,:],Scores[:,1])
    Corrcoef[1,cc]=CorrRse[0,1]
    CorrPse=np.corrcoef(pre_y_list[2,:],Scores[:,2])
    Corrcoef[2,cc]=CorrPse[0,1]
    PredScores[cc,:,:]=pre_y_list

plt.figure()
plt.plot(C,Corrcoef[0,:],C,Corrcoef[1,:],C,Corrcoef[2,:])
plt.legend(['RValue of CSE','RValue of RSE','RValue of PSE'])
plt.show()

CseInd=np.float32(np.where(Corrcoef[0,:]==np.max(Corrcoef[0,:])))
CseInd=np.int(CseInd[0])
CseScores=PredScores[CseInd,0,:]

RseInd=np.float32(np.where(Corrcoef[1,:]==np.max(Corrcoef[1,:])))
RseInd=np.int(RseInd[0])
RseScores=PredScores[RseInd,1,:]

PseInd=np.float32(np.where(Corrcoef[2,:]==np.max(Corrcoef[2,:])))
PseInd=np.int(PseInd[0])
PseScores=PredScores[PseInd,2,:]

sio.savemat('result/indet/PredCseScores.mat', {'PredCseScores':CseScores})
sio.savemat('result/indet/PredRseScores.mat', {'PredRseScores':RseScores})
sio.savemat('result/indet/PredPseScores.mat', {'PredPseScores':PseScores})
